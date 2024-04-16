.include "msp430g2553.s"

.equ	UART_RX_PIN,	BIT1
.equ	UART_TX_PIN,	BIT2

.equ	UART_STATUS,	0x3ff
.equ	UART_RX_READY,  1
.equ	UART_TX_READY,	2
.equ	UART_TX_BYTE,	4

.equ	UART_BUFFER,	0x3fe
.equ	STACK_TOP,	0x3fe


.section .text
Reset:
	; Initialize stack pointer.
	mov.w	#STACK_TOP, r1

	; Stop watchdog timer.
	mov.w	#WDTPW|WDTHOLD, &WDTCTL

	; Set DCO at 16MHz.
	mov.b	&CALBC1_16MHZ, &BCSCTL1
	mov.b	&CALDCO_16MHZ, &DCOCTL

	; Allow USCI to control UART_RX_PIN & UART_TX_PIN.
	bis.b	#UART_RX_PIN|UART_TX_PIN, &P1SEL
	bis.b	#UART_RX_PIN|UART_TX_PIN, &P1SEL2

	; Configure USCI A0 for UART operation at 19200 baud.
	bis.b	#UCSWRST, &UCA0CTL1
	clr.b	&UCA0CTL0
	mov.b	#UCMODE_0|UCSSEL_2, &UCA0CTL1
	mov.b	#0x41, &UCA0BR0
	mov.b	#0x03, &UCA0BR1
	mov.b	#UCBRS_2, &UCA0MCTL
	bic.b	#UCSWRST, &UCA0CTL1

	; Allow USCI A0 RX & TX interrupts.
	bis.b	#UCA0RXIE|UCA0TXIE, &UC0IE


Echo:
	; Sleep in Low Power Mode 4, with interrupts enabled.
	bis.w	#LPM4|GIE, r2

	; Interrupted to exercise the UART in active mode.
	call	#ReceiveByte
	call	#TransmitByte

	; Go back to sleep.
	jmp	Echo


ReceiveByte:
	; Ready to receive?
	bit.b	#UART_RX_READY, &UART_STATUS
	jz	EndReceiveByte

	; Receive byte, and set the Transmit-Byte flag.
	mov.b	&UCA0RXBUF, &UART_BUFFER 
	bis.b	#UART_TX_BYTE, &UART_STATUS

	; Clear the Receive-Ready status flag, and return.
	bic.b	#UART_RX_READY, &UART_STATUS

EndReceiveByte:
	ret


TransmitByte:
	; Is a byte awaiting transmission?
	bit.b	#UART_TX_BYTE, &UART_STATUS
	jz	EnableTXInterrupt

	; Ready to transmit?
	bit.b	#UART_TX_READY, &UART_STATUS
	jz	EnableTXInterrupt

	; Transmit byte.
	mov.b	&UART_BUFFER, &UCA0TXBUF

	; Clear both transmission status flags.
	bic.b	#UART_TX_READY|UART_TX_BYTE, &UART_STATUS

EnableTXInterrupt:
	bis.b	#UCA0TXIE, &UC0IE
	ret


ReadyToReceive:
	; Ignore interrupt if not related to USCI A0 RX.
	bit.b	#UCA0RXIFG, &UC0IFG
	jz	ReturnToActiveMode

	; Clear the USCI A0 RX interrupt flag.
	bic.b	#UCA0RXIFG, &UC0IFG

	; Set the Receive-Ready status flag.
	bis.b	#UART_RX_READY, &UART_STATUS

	; Return to active mode.
	jmp	ReturnToActiveMode


ReadyToTransmit:
	; Ignore interrupt if not related to USCI A0 TX.
	bit.b	#UCA0TXIFG, &UC0IFG
	jz	ReturnToActiveMode

	; Disable the USCI A0 TX interrupt.
	bic.b	#UCA0TXIE, &UC0IE

	; Set the Transmit-Ready status flag.
	bis.b	#UART_TX_READY, &UART_STATUS


ReturnToActiveMode:
	; Clear the LPM4 flags from the saved Status Register.
	bic.w	#LPM4, 0(r1)
	reti


IgnoreInterrupt:
	reti


.section .vectors, "ax"
.org	PORT1_VECTOR
.word	IgnoreInterrupt

.org	PORT2_VECTOR
.word	IgnoreInterrupt

.org	ADC10_VECTOR
.word	IgnoreInterrupt

.org	USCIAB0TX_VECTOR
.word	ReadyToTransmit

.org	USCIAB0RX_VECTOR
.word	ReadyToReceive

.org	TIMER0_A1_VECTOR
.word	IgnoreInterrupt

.org	TIMER0_A0_VECTOR
.word	IgnoreInterrupt

.org	WDT_VECTOR
.word	IgnoreInterrupt

.org	COMPARATORA_VECTOR
.word	IgnoreInterrupt

.org	TIMER1_A1_VECTOR
.word	IgnoreInterrupt

.org	TIMER1_A0_VECTOR
.word	IgnoreInterrupt

.org	NMI_VECTOR
.word	IgnoreInterrupt

.org	RESET_VECTOR
.word	Reset
