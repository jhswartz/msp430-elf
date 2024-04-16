; -- Bit Definitions --------------------------------------------------------

.equ BIT0, 		(1 << 0)
.equ BIT1, 		(1 << 1)
.equ BIT2, 		(1 << 2)
.equ BIT3, 		(1 << 3)
.equ BIT4, 		(1 << 4)
.equ BIT5, 		(1 << 5)
.equ BIT6, 		(1 << 6)
.equ BIT7, 		(1 << 7)
.equ BIT8, 		(1 << 8)


; -- Status Flags -----------------------------------------------------------

.equ C,		        BIT0
.equ Z,		        BIT1
.equ N,		        BIT2
.equ GIE,	        BIT3
.equ CPUOFF,	        BIT4
.equ OSCOFF,	        BIT5
.equ SCG0,	        BIT6
.equ SCG1,	        BIT7
.equ V,		        BIT8

.equ LPM0,		CPUOFF
.equ LPM1,		SCG0|CPUOFF
.equ LPM2,		SCG1|CPUOFF
.equ LPM3,		SCG1|SCG0|CPUOFF
.equ LPM4,		OSCOFF|SCG1|SCG0|CPUOFF


; -- I/O Port Declarations --------------------------------------------------

.equ P1IN,              0x0020          ; Port 1 Input
.equ P1OUT,             0x0021          ; Port 1 Output
.equ P1DIR,             0x0022          ; Port 1 Direction
.equ P1IFG,             0x0023          ; Port 1 Interrupt Flags
.equ P1IES,             0x0024          ; Port 1 Interrupt Edge Selection
.equ P1IE,              0x0025          ; Port 1 Interrupt Enable
.equ P1SEL,             0x0026          ; Port 1 Pin Function Selection
.equ P1REN,             0x0027          ; Port 1 Resistor Enable
.equ P1SEL2,            0x0041          ; Port 1 Pin Function Selection (2)

.equ P2IN,              0x0028          ; Port 2 Input
.equ P2OUT,             0x0029          ; Port 2 Output
.equ P2DIR,             0x002a          ; Port 2 Direction
.equ P2IFG,             0x002b          ; Port 2 Interrupt Flags
.equ P2IES,             0x002c          ; Port 2 Interrupt Edge Selection
.equ P2IE,              0x002d          ; Port 2 Interrupt Enable
.equ P2SEL,             0x002e          ; Port 2 Pin Function Selection
.equ P2REN,             0x002f          ; Port 2 Resistor Enable
.equ P2SEL2,            0x0042          ; Port 2 Pin Function Selection (2)


; -- Clock Control ----------------------------------------------------------

.equ DCOCTL,            0x0056          ; DCO Frequency Control
.equ BCSCTL1,           0x0057          ; Basic Clock System Control 1
.equ BCSCTL2,           0x0058          ; Basic Clock System Control 2
.equ BCSCTL3,           0x0053          ; Basic Clock System Control 3


; -- Clock Calibration Data -------------------------------------------------

.equ CALDCO_16MHZ,      0x10f8          ; DCOCTL  @ 16MHz
.equ CALBC1_16MHZ,      0x10f9          ; BCSCTL1 @ 16MHz
.equ CALDCO_12MHZ,      0x10fa          ; DC0CTL  @ 12MHz
.equ CALBC1_12MHZ,      0x10fb          ; BCSCTL1 @ 12MHz
.equ CALDC0_8MHZ,       0x10fc          ; DCOCTL  @  8MHz
.equ CALBC1_8MHZ,       0x10fd          ; BCSCTL1 @  8MHz
.equ CALDCO_1MHZ,       0x10fe          ; DCOCTL  @  1MHz
.equ CALBC1_1MHZ,       0x10ff          ; BCSCTL1 @  1MHz


; -- Watchdog Timer ---------------------------------------------------------

.equ WDTCTL,            0x0120          ; Watchdog Timer Control
.equ WDTIS0,            BIT0
.equ WDTIS1,            BIT1
.equ WDTSSEL,           BIT2
.equ WDTCNTCL,          BIT3
.equ WDTTMSEL,          BIT4
.equ WDTNMI,            BIT5
.equ WDTNMIES,          BIT6
.equ WDTHOLD,           BIT7
.equ WDTPW,             (0x5a00)


; -- Memory Mapped Register Declarations ------------------------------------

.equ IE1,		0x0000		; Interrupt Enable (1)
.equ WDTIE,	        BIT0		; ... Watchdog Timer
.equ OFIE,	        BIT1		; ... Oscillator Fault
.equ PORIE,	        BIT2		; ... Power On Reset
.equ RSTIE,	        BIT3		; ... Reset
.equ NMIIE,	        BIT4		; ... Non Maskable Interrupt
.equ ACCVIE,	        BIT5		; ... Flash Access Violation

.equ IFG1,		0x0002 		; Interrupt Flags (1)
.equ WDTIFG,	        BIT0		; ... Watchdog Timer
.equ OFIFG,	        BIT1		; ... Oscillator Fault
.equ PORIFG,	        BIT2		; ... Power On Reset
.equ RSTIFG,	        BIT3		; ... Reset
.equ NMIIFG,	        BIT4		; ... Non-maskable Interrupt
.equ ACCVIE,	        BIT5		; ... Flash Access Violation

.equ IE2,		0x0001		; Interrupt Enable (2)
.equ UC0IE,             IE2             ; (aka: USCI Interrupt Enable)
.equ UCA0RXIE,          BIT0            ; ... USCI A0 RX
.equ UCA0TXIE,          BIT1            ; ... USCI A0 TX
.equ UCB0RXIE,          BIT2            ; ... USCI B0 RX
.equ UCB0TXIE,          BIT3            ; ... USCI B0 TX

.equ IFG2,              0x0003          ; Interrupt Flags (2)
.equ UC0IFG,            IFG2            ; (aka: USCI Interrupt Flags)
.equ UCA0RXIFG,         BIT0            ; ... USCI A0 RX
.equ UCA0TXIFG,         BIT1            ; ... USCI A0 TX
.equ UCB0RXIFG,         BIT2            ; ... USCI B0 RX
.equ UCB0TXIFG,         BIT3            ; ... USCI B0 TX


; -- USCI Parameters --------------------------------------------------------

.equ UCA0ABCTL,         0x005d          ; USCI A0 LIN Control 
.equ UCA0IRTCTL,        0x005e          ; USCI A0 IrDA Transmit Control
.equ UCA0IRRCTL,        0x005f          ; USCI A0 IrDA Receive Control
.equ UCA0CTL0,          0x0060          ; USCI A0 Control 0
.equ UCA0CTL1,          0x0061          ; USCI A0 Control 1
.equ UCA0BR0,           0x0062          ; USCI A0 Baud Rate 0
.equ UCA0BR1,           0x0063          ; USCI A0 Baud Rate 1
.equ UCA0MCTL,          0x0064          ; USCI A0 Modulation Control
.equ UCA0STAT,          0x0065          ; USCI A0 Status Register 
.equ UCA0RXBUF,         0x0066          ; USCI A0 Receive Buffer
.equ UCA0TXBUF,         0x0067          ; USCI A0 Transmit Buffer

.equ UCSWRST,           BIT0            ; Software Reset
.equ UCTXBRK,           BIT1            ; Send Break Next
.equ UCTXADDR,          BIT2            ; Send Address Next
.equ UCDORM,            BIT3            ; Dormant Mode
.equ UCBRKIE,           BIT4            ; Break Interrupt Enable
.equ UCRXEIE,           BIT5            ; RX Error Interrupt Enable
.equ UCSSEL0,           BIT6            ; USCI Async. Clock Source 0
.equ UCSSEL1,           BIT7            ; USCI Async. Clock Source 1

.equ UCBRS_0,           0x00            ; USCI 2nd Stage Modulation: 0
.equ UCBRS_1,           0x02            ; USCI 2nd Stage Modulation: 1
.equ UCBRS_2,           0x04            ; USCI 2nd Stage Modulation: 2
.equ UCBRS_3,           0x06            ; USCI 2nd Stage Modulation: 3
.equ UCBRS_4,           0x08            ; USCI 2nd Stage Modulation: 4
.equ UCBRS_5,           0x0a            ; USCI 2nd Stage Modulation: 5
.equ UCBRS_6,           0x0c            ; USCI 2nd Stage Modulation: 6
.equ UCBRS_7,           0x0e            ; USCI 2nd Stage Modulation: 7

.equ UCSSEL_0,          0x00            ; USCI Sync. Clock Source 0
.equ UCSSEL_1,          0x40            ; USCI Sync. Clock Source 1
.equ UCSSEL_2,          0x80            ; USCI Sync. Clock Source 2
.equ UCSSEL_3,          0xc0            ; USCI Sync. Clock Source 3

.equ UCMODE_0,          0               ; USCI Sync. Mode 0
.equ UCMODE_1,          2               ; USCI Sync. Mode 1
.equ UCMODE_2,          4               ; USCI Sync. Mode 2
.equ UCMODE_3,          6               ; USCI Sync. Mode 3


; -- Interrupt Vector Table -------------------------------------------------

.equ VECTOR_TABLE,      0xffe0		; Interrupt Vector Table
.equ PORT1_VECTOR,      0x0004          ; ... Port 1 Offset
.equ PORT2_VECTOR,      0x0006          ; ... Port 2 Offset
.equ ADC10_VECTOR,      0x000a          ; ... ADC10 Offset
.equ USCIAB0TX_VECTOR,  0x000c          ; ... USCI A0 & B0 TX Offset
.equ USCIAB0RX_VECTOR,  0x000e          ; ... USCI A0 & B0 RX Offset
.equ TIMER0_A1_VECTOR,  0x0010          ; ... Timer 0 A1 Offset
.equ TIMER0_A0_VECTOR,  0x0012          ; ... Timer 0 A0 Offset
.equ WDT_VECTOR,        0x0014          ; ... Watchdog Timer Offset
.equ COMPARATORA_VECTOR,0x0016          ; ... Comparator A Offset
.equ TIMER1_A1_VECTOR,  0x0018          ; ... Timer 1 A1 Offset
.equ TIMER1_A0_VECTOR,  0x001a          ; ... Timer 1 A0 Offset
.equ NMI_VECTOR,        0x001c          ; ... Non-maskable Interrupt Offset
.equ RESET_VECTOR,      0x001e          ; ... Reset Offset
