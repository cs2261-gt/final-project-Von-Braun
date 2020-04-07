	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	hbl_pal_invert_vcnt
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	hbl_pal_invert_vcnt, %function
hbl_pal_invert_vcnt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #16
	mov	r1, #83886080
	mov	r0, #3
	ldr	r2, .L7
	ldr	r4, .L7+4
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L7+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L7+12
	ldrsh	r2, [r3]
	cmp	r2, #1
	bne	.L2
	mov	r1, #83886080
	ldrh	r0, [r1, #16]
	strh	r0, [r3]	@ movhi
	ldrh	r0, [r1, #20]
	strh	r0, [r1, #16]	@ movhi
	ldrh	r0, [r3]
	strh	r0, [r1, #20]	@ movhi
	strh	r2, [r3]	@ movhi
.L2:
	mov	r2, #67108864
.L3:
	ldrh	r3, [r2, #6]
	cmp	r3, #89
	bls	.L3
	mov	r3, #16
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L7
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L7+16
	pop	{r4, lr}
	strh	r2, [r3, #2]	@ movhi
	bx	lr
.L8:
	.align	2
.L7:
	.word	83886112
	.word	DMANow
	.word	PauseMenuPal
	.word	.LANCHOR0
	.word	67109376
	.size	hbl_pal_invert_vcnt, .-hbl_pal_invert_vcnt
	.align	2
	.global	switch_graphics_mode
	.syntax unified
	.arm
	.fpu softvfp
	.type	switch_graphics_mode, %function
switch_graphics_mode:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #4
	bxne	lr
	ldr	r1, .L20
	ldrb	r3, [r1]	@ zero_extendqisi2
	sub	r2, r3, #2
	cmp	r3, #0
	cmpne	r2, #1
	bxhi	lr
	mov	r3, #83886080
	mov	ip, #0
	push	{r4, lr}
	ldr	r2, .L20+4
.L11:
	strh	ip, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L11
	mov	r2, #256
	mov	r3, #16777216
	mov	lr, #67108864
	stmib	r1, {r2, r3}
	str	ip, [r1, #12]
	str	ip, [r1, #16]
	ldr	r3, .L20+8
	ldr	r4, .L20+12
	ldm	r3, {r0, r1, r2, r3}
	stm	r4, {r0, r1, r2, r3}
	ldr	r3, .L20+16
	strh	ip, [lr, #12]	@ movhi
	strh	r3, [lr]	@ movhi
	strh	ip, [lr, #24]	@ movhi
	strh	ip, [lr, #26]	@ movhi
	pop	{r4, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	.LANCHOR1
	.word	83886592
	.word	.LANCHOR1+4
	.word	67108896
	.word	1044
	.size	switch_graphics_mode, .-switch_graphics_mode
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	next_station.part.0, %function
next_station.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, lr}
	ldr	r4, .L24
	ldr	r3, .L24+4
	ldrb	r0, [r4]	@ zero_extendqisi2
	ldr	r1, .L24+8
	strb	r0, [r1]
	strh	r2, [r3, #8]	@ movhi
	mov	r0, #4
	bl	switch_graphics_mode
	mov	r3, #4
	strb	r3, [r4]
	pop	{r4, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	.LANCHOR1
	.word	67109376
	.word	oldSTATE
	.size	next_station.part.0, .-next_station.part.0
	.align	2
	.global	clear_screen_M4
	.syntax unified
	.arm
	.fpu softvfp
	.type	clear_screen_M4, %function
clear_screen_M4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	mov	r3, #250
	push	{r4, lr}
	sub	sp, sp, #8
	str	r3, [sp]
	mov	r0, r1
	mov	r3, #240
	mov	r2, #160
	ldr	r4, .L28
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	drawRect4
	.size	clear_screen_M4, .-clear_screen_M4
	.align	2
	.global	change_state
	.syntax unified
	.arm
	.fpu softvfp
	.type	change_state, %function
change_state:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L37
	ldr	r3, .L37+4
	ldrb	r2, [r5]	@ zero_extendqisi2
	cmp	r0, #2
	mov	r4, r0
	strb	r2, [r3]
	beq	.L31
	cmp	r0, #3
	bne	.L32
	mov	r2, #67108864
	mov	r0, #1
	ldrh	r3, [r2, #4]
	and	r3, r3, #255
	orr	r3, r3, #7168
	strh	r3, [r2, #4]	@ movhi
	ldrh	r3, [r2, #4]
	orr	r3, r3, #32
	strh	r3, [r2, #4]	@ movhi
	ldr	r3, .L37+8
	ldrh	r2, [r3]
	orr	r2, r2, #4
	strh	r2, [r3]	@ movhi
	ldr	r1, .L37+12
	ldr	r2, .L37+16
	strh	r0, [r3, #8]	@ movhi
	str	r2, [r1, #4092]
.L31:
	strb	r4, [r5]
	pop	{r4, r5, r6, lr}
	bx	lr
.L32:
	mov	r2, #0
	ldr	r3, .L37+8
	mov	r0, #4
	strh	r2, [r3, #8]	@ movhi
	bl	switch_graphics_mode
	strb	r4, [r5]
	pop	{r4, r5, r6, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	.LANCHOR1
	.word	oldSTATE
	.word	67109376
	.word	50360320
	.word	hbl_pal_invert_vcnt
	.size	change_state, .-change_state
	.align	2
	.global	initialize_GAME
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize_GAME, %function
initialize_GAME:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	mov	r3, #250
	push	{r4, lr}
	ldr	r2, .L48
	sub	sp, sp, #8
	strh	r1, [r2, #8]	@ movhi
	mov	r0, r1
	mov	r2, #160
	str	r3, [sp]
	ldr	r4, .L48+4
	mov	r3, #240
	mov	lr, pc
	bx	r4
	ldr	r3, .L48+8
	mov	lr, pc
	bx	r3
	ldr	r1, .L48+12
	ldrb	r3, [r1, #20]	@ zero_extendqisi2
	sub	r3, r3, #1
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L46
.L42:
	.word	.L45
	.word	.L44
	.word	.L43
	.word	.L41
.L41:
	mov	r3, #500
	ldr	r2, .L48+16
	strh	r3, [r2, #2]	@ movhi
.L40:
	mov	r3, #0
	mov	r0, #1
	mov	lr, #103
	ldr	ip, .L48+20
	strb	r3, [ip]
	ldr	ip, .L48+24
	str	r3, [r2, #4]
	str	r3, [r2, #8]
	strb	r3, [r2, #13]
	strh	r3, [r2]	@ movhi
	str	r3, [r2, #16]
	str	r3, [r2, #20]
	strh	r3, [ip, #2]	@ movhi
	strh	r3, [ip, #4]	@ movhi
	strh	r3, [ip, #6]	@ movhi
	strb	r3, [ip, #8]
	ldr	r3, .L48+28
	strb	r0, [r1, #20]
	strb	lr, [ip]
	strb	r0, [r1, #21]
	strb	r0, [r2, #12]
	strh	r0, [r1, #22]	@ movhi
	strb	r0, [r1, #28]
	str	r3, [r1, #24]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L43:
	mov	r3, #600
	ldr	r2, .L48+16
	strh	r3, [r2, #2]	@ movhi
	b	.L40
.L44:
	ldr	r2, .L48+16
	ldr	r3, .L48+32
	strh	r3, [r2, #2]	@ movhi
	b	.L40
.L45:
	mov	r3, #900
	ldr	r2, .L48+16
	strh	r3, [r2, #2]	@ movhi
	b	.L40
.L46:
	ldr	r2, .L48+16
	b	.L40
.L49:
	.align	2
.L48:
	.word	67109376
	.word	drawRect4
	.word	flipPage
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	sprite_count
	.word	player_ship
	.word	33555455
	.word	750
	.size	initialize_GAME, .-initialize_GAME
	.align	2
	.global	next_station
	.syntax unified
	.arm
	.fpu softvfp
	.type	next_station, %function
next_station:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L54
	ldrb	r2, [r3, #21]	@ zero_extendqisi2
	add	r3, r3, r2
	ldrb	r4, [r3, #24]	@ zero_extendqisi2
	cmp	r4, #255
	beq	.L53
	mov	r0, r4
	pop	{r4, lr}
	bx	lr
.L53:
	bl	next_station.part.0
	mov	r0, r4
	pop	{r4, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	.LANCHOR1
	.size	next_station, .-next_station
	.align	2
	.global	begin_interupts_vcount
	.syntax unified
	.arm
	.fpu softvfp
	.type	begin_interupts_vcount, %function
begin_interupts_vcount:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	mov	r1, #1
	ldrh	r3, [r2, #4]
	and	r3, r3, #255
	orr	r3, r3, #7168
	strh	r3, [r2, #4]	@ movhi
	ldrh	r3, [r2, #4]
	orr	r3, r3, #32
	strh	r3, [r2, #4]	@ movhi
	ldr	r3, .L57
	ldrh	r2, [r3]
	ldr	r0, .L57+4
	ldr	ip, .L57+8
	orr	r2, r2, #4
	strh	r2, [r3]	@ movhi
	str	ip, [r0, #4092]
	strh	r1, [r3, #8]	@ movhi
	bx	lr
.L58:
	.align	2
.L57:
	.word	67109376
	.word	50360320
	.word	hbl_pal_invert_vcnt
	.size	begin_interupts_vcount, .-begin_interupts_vcount
	.align	2
	.global	stop_interupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	stop_interupts, %function
stop_interupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L60
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L61:
	.align	2
.L60:
	.word	67109376
	.size	stop_interupts, .-stop_interupts
	.global	__aeabi_uidivmod
	.align	2
	.global	move_player
	.syntax unified
	.arm
	.fpu softvfp
	.type	move_player, %function
move_player:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L82
	ldr	r1, .L82+4
	ldrsh	r2, [r4, #2]
	smull	r3, r1, r2, r1
	ldr	r0, .L82+8
	add	r1, r1, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #5
	lsl	r3, r3, #16
	ldr	r1, [r0, #20]
	asr	r3, r3, #16
	add	r3, r3, r1
	cmp	r2, #0
	str	r3, [r0, #20]
	ble	.L63
	cmp	r2, #2
	bgt	.L79
.L75:
	mov	r2, #0
.L66:
	strh	r2, [r4, #2]	@ movhi
.L65:
	ldrsh	r5, [r4, #4]
	eor	r3, r5, r5, asr #31
	sub	r3, r3, r5, asr #31
	ldr	r1, .L82+4
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	smull	r2, r1, r3, r1
	add	r1, r1, r3
	asr	r1, r1, #3
	ldr	r3, .L82+12
	ldr	r0, [r0, #24]
	rsb	r1, r1, #16
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	ldrb	r3, [r4]	@ zero_extendqisi2
	bne	.L67
	cmp	r5, #0
	blt	.L80
	bne	.L81
.L69:
	cmp	r3, #7
	bhi	.L67
	mov	r3, #8
	mov	r5, #0
	strb	r3, [r4]
.L70:
	add	r5, r5, #1
	lsl	r5, r5, #16
	asr	r5, r5, #16
.L72:
	strh	r5, [r4, #4]	@ movhi
.L62:
	pop	{r4, r5, r6, lr}
	bx	lr
.L79:
	sub	r2, r2, #2
	lsl	r2, r2, #16
	asr	r2, r2, #16
	b	.L66
.L67:
	cmp	r3, #102
	movhi	r3, #0
	strhhi	r3, [r4, #4]	@ movhi
	bhi	.L62
	cmn	r5, #241
	mvnlt	r5, #239
	blt	.L72
	cmp	r5, #239
	movgt	r5, #240
	bgt	.L72
	b	.L70
.L63:
	beq	.L65
	cmn	r2, #2
	bge	.L75
	add	r2, r2, #2
	lsl	r2, r2, #16
	asr	r2, r2, #16
	b	.L66
.L80:
	cmp	r3, #104
	movcs	r3, #104
	sub	r3, r3, #1
	and	r3, r3, #255
	strb	r3, [r4]
	b	.L69
.L81:
	cmp	r3, #102
	movcs	r3, #102
	add	r3, r3, #1
	and	r3, r3, #255
	strb	r3, [r4]
	b	.L69
.L83:
	.align	2
.L82:
	.word	player_ship
	.word	-2004318071
	.word	.LANCHOR0
	.word	__aeabi_uidivmod
	.size	move_player, .-move_player
	.align	2
	.global	turn_player
	.syntax unified
	.arm
	.fpu softvfp
	.type	turn_player, %function
turn_player:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L86
	ldrsh	r2, [r1, #6]
	adds	r3, r2, r0
	addmi	r3, r2, #508
	addmi	r3, r3, #3
	lslmi	r3, r3, #16
	asrmi	r3, r3, #16
	addmi	r3, r3, r0
	ldr	r0, .L86+4
	rsbs	r2, r3, #0
	and	r2, r2, r0
	and	r3, r3, r0
	rsbpl	r3, r2, #0
	strh	r3, [r1, #6]	@ movhi
	bx	lr
.L87:
	.align	2
.L86:
	.word	player_ship
	.word	511
	.size	turn_player, .-turn_player
	.align	2
	.global	activate_thrusters
	.syntax unified
	.arm
	.fpu softvfp
	.type	activate_thrusters, %function
activate_thrusters:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L101
	ldrsh	r3, [r0, #6]
	add	r2, r3, #31
	cmp	r3, #0
	movlt	r3, r2
	asr	r3, r3, #5
	rsbs	r2, r3, #0
	and	r2, r2, #15
	and	r3, r3, #15
	rsbpl	r3, r2, #0
	ands	r1, r3, #247
	push	{r4, lr}
	ldrsh	r2, [r0, #4]
	ldrsh	ip, [r0, #2]
	and	r3, r3, #255
	bne	.L89
	subs	r1, r3, #4
	submi	r3, r3, #1
	movpl	r3, r1
	bic	r3, r3, #3
	add	r2, r3, r2
	lsl	r2, r2, #16
	asr	r2, r2, #16
.L90:
	cmp	r2, #240
	mvn	r3, #239
	movge	r2, #240
	cmp	r2, r3
	movlt	r2, r3
	cmp	ip, #800
	movlt	r3, ip
	movge	r3, #800
	ldr	ip, .L101+4
	cmp	r3, ip
	movlt	r3, ip
	strh	r2, [r0, #4]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L89:
	cmp	r1, #4
	bne	.L91
	subs	r1, r3, #8
	submi	r3, r3, #5
	movpl	r3, r1
	asr	r3, r3, #2
	add	r3, ip, r3, lsl #3
	lsl	ip, r3, #16
	asr	ip, ip, #16
	b	.L90
.L91:
	cmp	r3, #15
	cmpne	r3, #1
	beq	.L99
	sub	r1, r3, #3
	tst	r1, #253
	bne	.L93
	sub	r3, r3, #4
	add	r2, r2, r3, lsl #1
	sub	r3, ip, #8
	lsl	r2, r2, #16
	lsl	ip, r3, #16
	asr	r2, r2, #16
	asr	ip, ip, #16
	b	.L90
.L99:
	ldr	r1, .L101+8
	sub	r3, r3, #8
	smull	lr, r1, r3, r1
	add	r1, r1, r3
	asr	r3, r3, #31
	rsb	r3, r3, r1, asr #2
	sub	r2, r2, #4
	add	r3, ip, r3, lsl #2
	lsl	r2, r2, #16
	lsl	ip, r3, #16
	asr	r2, r2, #16
	asr	ip, ip, #16
	b	.L90
.L93:
	sub	r1, r3, #11
	tst	r1, #253
	beq	.L100
	sub	r1, r3, #7
	tst	r1, #253
	subeq	r1, r3, #8
	addeq	r3, ip, r1, lsl #2
	beq	.L98
	cmp	r3, #14
	cmpne	r3, #2
	bne	.L96
	ldr	lr, .L101+12
	sub	r1, r3, #8
	smull	r4, r3, lr, r1
	sub	r3, r3, r1, asr #31
	sub	r2, r2, #4
	add	r3, ip, r3, lsl #3
	lsl	r2, r2, #16
	lsl	ip, r3, #16
	asr	r2, r2, #16
	asr	ip, ip, #16
	b	.L90
.L100:
	sub	r1, r3, #12
	sub	r2, r2, r1, lsl #1
	add	r3, ip, #8
	lsl	r2, r2, #16
	lsl	ip, r3, #16
	asr	r2, r2, #16
	asr	ip, ip, #16
	b	.L90
.L96:
	sub	r1, r3, #6
	tst	r1, #251
	bne	.L90
	sub	r1, r3, #8
	add	r3, r1, r1, lsr #31
	asr	r3, r3, #1
	add	r3, ip, r3, lsl #3
.L98:
	add	r2, r2, #4
	lsl	ip, r3, #16
	lsl	r2, r2, #16
	asr	ip, ip, #16
	asr	r2, r2, #16
	b	.L90
.L102:
	.align	2
.L101:
	.word	player_ship
	.word	-800
	.word	-1840700269
	.word	715827883
	.size	activate_thrusters, .-activate_thrusters
	.align	2
	.global	set_counter
	.syntax unified
	.arm
	.fpu softvfp
	.type	set_counter, %function
set_counter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r6, #5
	ldr	r3, .L107
	ldr	r2, .L107+4
	smull	r1, r3, r0, r3
	smull	ip, r1, r2, r0
	mov	r5, #126
	mov	r7, #3
	asr	lr, r0, #31
	rsb	r3, lr, r3, asr r6
	lsl	r3, r3, #16
	rsb	lr, lr, r1, asr #2
	lsl	r1, lr, #16
	asr	r4, r3, #16
	smull	ip, r9, r2, r4
	asr	ip, r1, #16
	smull	r10, r8, r2, ip
	asr	r3, r3, #31
	rsb	r3, r3, r9, asr #2
	asr	r2, r1, #31
	rsb	r2, r2, r8, asr #2
	add	r3, r3, r3, lsl #2
	add	lr, lr, lr, lsl #2
	sub	r4, r4, r3, lsl #1
	add	r2, r2, r2, lsl #2
	sub	sp, sp, #16
	sub	r0, r0, lr, lsl #1
	and	r4, r4, #255
	sub	r2, ip, r2, lsl #1
	strb	r0, [sp, #14]
	strb	r4, [sp, #12]
	strb	r2, [sp, #13]
	ldr	r8, .L107+8
	add	r9, sp, #13
.L105:
	lsl	r4, r4, #4
	add	r4, r4, #8
	mov	r1, r5
	mov	r0, r4
	mov	r3, #5
	mov	r2, #0
	str	r7, [sp]
	mov	lr, pc
	bx	r8
	add	r1, r5, #19
	mov	r0, r4
	mov	r3, #0
	mov	r2, #3
	str	r6, [sp]
	add	r5, r5, #1
	mov	lr, pc
	bx	r8
	cmp	r5, #129
	ldrbne	r4, [r9], #1	@ zero_extendqisi2
	bne	.L105
.L103:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L108:
	.align	2
.L107:
	.word	1374389535
	.word	1717986919
	.word	overwrite_BG_tile
	.size	set_counter, .-set_counter
	.align	2
	.global	set_score
	.syntax unified
	.arm
	.fpu softvfp
	.type	set_score, %function
set_score:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, #13
	ldr	fp, .L114
	ldr	r9, .L114+4
	ldr	r8, .L114+8
	lsr	r4, r0, #5
	mov	r7, #3
	umull	r1, r4, fp, r4
	umull	r1, r9, r0, r9
	umull	r1, r8, r0, r8
	mov	r6, #5
	ldr	r3, .L114+12
	ldr	r2, .L114+16
	umull	r1, lr, r3, r0
	umull	r1, r2, r0, r2
	lsr	r9, r9, r5
	lsr	r8, r8, #6
	lsr	fp, r4, #7
	umull	r1, ip, r3, r9
	umull	r1, r4, r3, fp
	umull	r10, r1, r3, r8
	sub	sp, sp, #28
	lsr	lr, lr, r7
	lsr	r2, r2, r6
	str	r1, [sp, #12]
	umull	r1, r10, r3, r2
	umull	r1, r3, lr, r3
	ldr	r1, [sp, #12]
	lsr	r4, r4, r7
	lsr	r3, r3, r7
	add	r4, r4, r4, lsl #2
	lsr	ip, ip, r7
	lsr	r1, r1, r7
	lsr	r10, r10, r7
	add	r3, r3, r3, lsl #2
	sub	r3, lr, r3, lsl #1
	sub	r4, fp, r4, lsl #1
	add	ip, ip, ip, lsl #2
	add	r1, r1, r1, lsl #2
	add	r10, r10, r10, lsl #2
	add	lr, lr, lr, lsl #2
	sub	ip, r9, ip, lsl #1
	sub	r1, r8, r1, lsl #1
	and	r4, r4, #255
	sub	r10, r2, r10, lsl #1
	sub	r0, r0, lr, lsl #1
	strb	r4, [sp, #16]
	strb	ip, [sp, #17]
	strb	r1, [sp, #18]
	strb	r10, [sp, #19]
	strb	r3, [sp, #20]
	strb	r0, [sp, #21]
	ldr	r8, .L114+20
	add	r9, sp, #17
	b	.L111
.L113:
	ldrb	r4, [r9], #1	@ zero_extendqisi2
.L111:
	lsl	r4, r4, #4
	add	r4, r4, #8
	mov	r1, r5
	mov	r0, r4
	mov	r3, #5
	mov	r2, #0
	str	r7, [sp]
	mov	lr, pc
	bx	r8
	add	r1, r5, #27
	mov	r0, r4
	mov	r3, #0
	mov	r2, #3
	str	r6, [sp]
	add	r5, r5, #1
	mov	lr, pc
	bx	r8
	cmp	r5, #19
	bne	.L113
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L115:
	.align	2
.L114:
	.word	175921861
	.word	-776530087
	.word	274877907
	.word	-858993459
	.word	1374389535
	.word	overwrite_BG_tile
	.size	set_score, .-set_score
	.align	2
	.global	set_level
	.syntax unified
	.arm
	.fpu softvfp
	.type	set_level, %function
set_level:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r6, #3
	lsl	r4, r0, #4
	sub	sp, sp, #8
	add	r4, r4, #9
	mov	r0, r4
	ldr	r5, .L118
	mov	r3, #5
	mov	r2, #0
	mov	r1, #26
	str	r6, [sp]
	mov	lr, pc
	bx	r5
	mov	r3, #5
	mov	r0, r4
	str	r3, [sp]
	mov	r2, r6
	mov	r3, #0
	mov	r1, #54
	mov	lr, pc
	bx	r5
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L119:
	.align	2
.L118:
	.word	overwrite_BG_tile
	.size	set_level, .-set_level
	.align	2
	.global	set_compass
	.syntax unified
	.arm
	.fpu softvfp
	.type	set_compass, %function
set_compass:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r6, #3
	mov	r7, #5
	mov	r4, r1
	lsl	r0, r0, #4
	sub	sp, sp, #8
	add	r5, r0, #10
	ldr	r8, .L122
	mov	r0, r5
	mov	r3, r7
	mov	r2, #0
	mov	r1, #9
	str	r6, [sp]
	lsl	r4, r4, #4
	mov	lr, pc
	bx	r8
	add	r4, r4, #11
	mov	r0, r5
	mov	r2, r6
	mov	r3, #0
	mov	r1, #36
	str	r7, [sp]
	mov	lr, pc
	bx	r8
	mov	r0, r4
	mov	r3, r7
	mov	r2, #0
	mov	r1, #10
	str	r6, [sp]
	mov	lr, pc
	bx	r8
	mov	r0, r4
	mov	r2, r6
	mov	r3, #0
	mov	r1, #37
	str	r7, [sp]
	mov	lr, pc
	bx	r8
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L123:
	.align	2
.L122:
	.word	overwrite_BG_tile
	.size	set_compass, .-set_compass
	.align	2
	.global	set_compass_target
	.syntax unified
	.arm
	.fpu softvfp
	.type	set_compass_target, %function
set_compass_target:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, r0
	bhi	.L127
	bxcs	lr
	mov	r0, r1
	mov	r1, #1
	b	set_compass
.L127:
	mov	r0, r1
	mov	r1, #0
	b	set_compass
	.size	set_compass_target, .-set_compass_target
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_dsub
	.global	__aeabi_dadd
	.global	__aeabi_d2uiz
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	mvn	r2, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r6, .L331+16
	mov	r4, #0
	mov	r5, r6
	ldr	r10, .L331+20
	ldr	r3, .L331+280
	strh	r2, [r10]	@ movhi
	ldr	fp, .L331+24
	ldrh	r1, [r3, #48]
	ldrb	r2, [r6]	@ zero_extendqisi2
	strh	r1, [fp]	@ movhi
	ldr	r1, .L331+384
	sub	sp, sp, #28
	add	r3, r3, #256
	strb	r2, [r1]
	mov	r0, #4
	str	r4, [sp, #12]
	strh	r4, [r3, #8]	@ movhi
	ldr	r3, .L331+388
	mov	lr, pc
	bx	r3
	strb	r4, [r5], #4
	ldr	r3, .L331+408
	str	r5, [sp, #8]
	mov	lr, pc
	bx	r3
	mov	r0, #128
	ldr	r3, .L331+28
	str	r4, [sp, #4]
	ldr	r7, .L331+32
	mov	lr, pc
	bx	r3
	b	.L215
.L301:
	ldr	r3, .L331+384
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L298
	ldr	r3, [sp, #4]
	cmp	r3, #0
	ldr	r4, [r6, #12]
	beq	.L132
	sub	r4, r4, #512
	cmp	r4, #0
	movle	r3, #0
	movgt	r3, #1
	str	r4, [r6, #12]
	str	r3, [sp, #4]
.L135:
	add	r4, r4, r4, lsl #2
	add	r4, r4, r4, lsl #2
	lsl	r4, r4, #2
	asr	r4, r4, #16
	sub	r4, r4, #50
	mul	r0, r4, r4
	ldr	r3, .L331+36
	mul	r0, r4, r0
	mov	lr, pc
	bx	r3
	adr	r3, .L331
	ldmia	r3, {r2-r3}
	ldr	ip, .L331+40
	mov	lr, pc
	bx	ip
	ldr	r3, .L331+36
	mov	r8, r0
	mov	r0, r4
	mov	r9, r1
	ldr	r4, .L331+40
	mov	lr, pc
	bx	r3
	adr	r3, .L331+8
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r4
	ldr	ip, .L331+44
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	ip
	ldr	ip, .L331+48
	mov	r2, #0
	ldr	r3, .L331+52
	mov	lr, pc
	bx	ip
	mov	r2, #0
	ldr	r3, .L331+56
	mov	lr, pc
	bx	r4
	ldr	r3, .L331+60
	mov	lr, pc
	bx	r3
	lsr	r0, r0, #15
	lsl	r0, r0, #16
	asr	r0, r0, #16
	strh	r0, [r6, #4]	@ movhi
	strh	r0, [r6, #10]	@ movhi
	ldr	r3, [sp, #8]
	ldr	ip, .L331+64
	ldm	r3, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	ldrh	r3, [r10]
	tst	r3, #1
	beq	.L136
	tst	r5, #1
	beq	.L299
.L136:
	tst	r3, #2
	beq	.L137
	ands	r3, r5, #2
	bne	.L137
	ldrb	r1, [r6]	@ zero_extendqisi2
	ldr	r2, .L331+380
	ldr	r0, .L331+384
	strb	r1, [r0]
	strh	r3, [r2, #8]	@ movhi
	mov	r0, #4
	ldr	r3, .L331+388
	mov	lr, pc
	bx	r3
	mov	r3, #1
	ldrh	r5, [fp]
	strb	r3, [r6]
.L137:
	ldr	r3, [r7, #24]
	add	r3, r3, #1
	strh	r5, [r10]	@ movhi
	str	r3, [r7, #24]
.L215:
	ldr	r3, .L331+68
	mov	lr, pc
	bx	r3
	ldr	r3, .L331+196
	ldrb	r0, [r3]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L300
.L129:
	ldr	r3, .L331+280
	ldrb	r4, [r6]	@ zero_extendqisi2
	ldrh	r5, [r3, #48]
	cmp	r4, #0
	strh	r5, [fp]	@ movhi
	beq	.L301
	cmp	r4, #1
	beq	.L302
	cmp	r4, #2
	beq	.L303
	cmp	r4, #3
	beq	.L304
	cmp	r4, #4
	beq	.L305
	cmp	r4, #5
	bne	.L137
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L331+72
	ldr	ip, .L331+428
	mov	r0, #3
	mov	lr, pc
	bx	ip
	ldr	r5, .L331+324
	ldr	r0, .L331+76
	ldr	r4, .L331+320
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldr	r0, .L331+76
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldrh	r3, [r10]
	tst	r3, #1
	ldrh	r5, [fp]
	beq	.L137
	ands	r4, r5, #1
	bne	.L137
.L295:
	ldrb	r2, [r6]	@ zero_extendqisi2
	ldr	r3, .L331+380
	ldr	r1, .L331+384
	mov	r0, #4
	strb	r2, [r1]
	strh	r4, [r3, #8]	@ movhi
	ldr	r3, .L331+388
	mov	lr, pc
	bx	r3
	strb	r4, [r6]
.L296:
	ldrh	r5, [fp]
	b	.L137
.L298:
	mov	r5, #67108864
	ldr	r2, .L331+80
	ldr	r3, .L331+384
	ldr	r8, .L331+428
	strb	r4, [r3]
	mov	r0, #3
	mov	r3, #64
	strh	r2, [r5]	@ movhi
	ldr	r1, .L331+84
	mov	r2, #83886080
	mov	lr, pc
	bx	r8
	ldr	r2, .L331+88
	mov	r3, #1360
	mov	r0, #3
	strh	r2, [r5, #8]	@ movhi
	ldr	r1, .L331+92
	ldr	r2, .L331+160
	mov	lr, pc
	bx	r8
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L331+148
	ldr	r1, .L331+96
	mov	lr, pc
	bx	r8
	ldr	r1, .L331+100
	strh	r4, [r5, #16]	@ movhi
	mov	r3, #1920
	mov	r0, #3
	strh	r4, [r5, #18]	@ movhi
	ldr	r2, .L331+348
	strh	r1, [r5, #10]	@ movhi
	ldr	r1, .L331+104
	mov	lr, pc
	bx	r8
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L331+352
	ldr	r1, .L331+108
	mov	lr, pc
	bx	r8
	ldr	r1, .L331+112
	strh	r4, [r5, #20]	@ movhi
	mov	r3, #96
	mov	r2, #100663296
	mov	r0, #3
	strh	r4, [r5, #22]	@ movhi
	strh	r1, [r5, #12]	@ movhi
	ldr	r1, .L331+116
	mov	lr, pc
	bx	r8
	mov	r3, #512
	mov	r0, #3
	ldr	r2, .L331+120
	ldr	r1, .L331+124
	mov	lr, pc
	bx	r8
	mov	r2, #64
	mov	r3, #4194304
	mov	ip, #83886080
	stmib	r6, {r2, r3}
	str	r4, [r6, #12]
	str	r4, [r6, #16]
	ldr	r3, [sp, #8]
	ldr	lr, .L331+64
	ldm	r3, {r0, r1, r2, r3}
	stm	lr, {r0, r1, r2, r3}
	ldrh	r3, [ip, #36]
	strh	r3, [ip, #132]	@ movhi
	mov	r3, #2
	ldrh	r2, [ip, #34]
	strh	r2, [ip, #130]	@ movhi
	str	r3, [sp, #12]
.L132:
	add	r4, r4, #512
	cmp	r4, #65536
	str	r4, [r6, #12]
	bge	.L134
	mov	r3, #0
	ldrh	r5, [fp]
	str	r3, [sp, #4]
	b	.L135
.L300:
	ldr	r3, .L331+28
	mov	lr, pc
	bx	r3
	b	.L129
.L332:
	.align	3
.L331:
	.word	810889825
	.word	1061398826
	.word	-1717986918
	.word	1072273817
	.word	.LANCHOR1
	.word	oldButtons
	.word	buttons
	.word	write_sprite_data
	.word	.LANCHOR0
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_dsub
	.word	__aeabi_dadd
	.word	1078853632
	.word	1089764064
	.word	__aeabi_d2uiz
	.word	67108896
	.word	waitForVBlank
	.word	losePal
	.word	loseBitmap
	.word	1793
	.word	Splash_borderPal
	.word	6408
	.word	Splash_borderTiles
	.word	Splash_borderMap
	.word	5637
	.word	Splash_title_textTiles
	.word	Splash_title_textMap
	.word	32258
	.word	spash_checkers_affineTiles
	.word	100724736
	.word	spash_checkers_affineMap
	.word	InstructionsPal
	.word	InstructionsBitmap
	.word	-1431655765
	.word	ship_uiPal
	.word	ship_uiTiles
	.word	100714496
	.word	ship_uiMap
	.word	23050
	.word	100696064
	.word	mountainsTiles
	.word	100716544
	.word	mountainsMap
	.word	-9201
	.word	100712448
	.word	starsTiles
	.word	100720640
	.word	starsMap
	.word	sprite_count
	.word	100728832
	.word	ship_000Tiles
	.word	ship_000Pal
	.word	16466
	.word	-16344
	.word	2050
	.word	-15921
	.word	16534
	.word	shadowOAM
	.word	5144
	.word	2184
	.word	10376
	.word	16516
	.word	16528
	.word	set_level
	.word	set_compass_target
	.word	143165576
	.word	83886592
	.word	71582788
	.word	set_counter
	.word	67109120
	.word	obj_aff_rotate
	.word	858993459
	.word	hide_sprite
	.word	5636
	.word	PauseMenuTiles
	.word	PauseMenuMap
	.word	move_player
	.word	100732224
	.word	winPal
	.word	drawFullscreenImage4
	.word	flipPage
	.word	winBitmap
	.word	initialize_GAME
	.word	show_all_sprites
	.word	22021
	.word	cratersTiles
	.word	100679680
	.word	100708352
	.word	cratersMap
	.word	activate_thrusters
	.word	511
	.word	set_score
	.word	-858993459
	.word	302
	.word	67109376
	.word	oldSTATE
	.word	switch_graphics_mode
	.word	player_ship
	.word	100729152
	.word	100731200
	.word	set_compass
	.word	hide_all_sprites
	.word	change_state
	.word	show_sprite
	.word	100731072
	.word	100730176
	.word	DMANow
	.word	-1970240362
	.word	set_sprite_location
.L302:
	ldr	ip, .L331+384
	ldrb	r3, [ip]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L139
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L331+128
	strb	r4, [ip]
	mov	r0, #3
	ldr	ip, .L331+428
	mov	lr, pc
	bx	ip
	ldr	r5, .L331+324
	ldr	r0, .L331+132
	ldr	r4, .L331+320
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldr	r0, .L331+132
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldrh	r5, [fp]
.L139:
	ldrh	r3, [r10]
	tst	r3, #1
	beq	.L140
	tst	r5, #1
	beq	.L306
.L140:
	tst	r3, #2
	beq	.L137
	ands	r4, r5, #2
	bne	.L137
	b	.L295
.L134:
	mov	r1, #83886080
	ldr	r2, [sp, #12]
	ldr	r3, .L331+136
	add	r2, r2, #1
	umull	r0, r3, r2, r3
	bic	r0, r3, #1
	add	r3, r0, r3, lsr #1
	sub	r2, r2, r3
	lsl	r3, r2, #5
	add	r3, r3, r1
	ldrh	r0, [r3, #66]
	strh	r0, [r1, #34]	@ movhi
	add	r3, r3, #64
	ldrh	r3, [r3, #4]
	strh	r3, [r1, #36]	@ movhi
	and	r3, r2, #255
	str	r3, [sp, #12]
	mov	r3, #1
	ldrh	r5, [fp]
	str	r3, [sp, #4]
	b	.L135
.L303:
	ldr	r3, .L331+384
	ldrb	r8, [r3]	@ zero_extendqisi2
	cmp	r8, #3
	beq	.L307
	cmp	r8, #2
	beq	.L143
	mov	r5, #67108864
	mov	r9, #7936
	ldr	r3, .L331+384
	mov	r2, #83886080
	strb	r4, [r3]
	mov	r0, #3
	mov	r3, #256
	ldr	r1, .L331+140
	ldr	ip, .L331+428
	strh	r9, [r5]	@ movhi
	mov	lr, pc
	bx	ip
	mov	r3, #6400
	mov	r8, #0
	mov	r2, #100663296
	mov	r0, #3
	strh	r3, [r5, #8]	@ movhi
	ldr	r1, .L331+144
	mov	r3, #2448
	ldr	ip, .L331+428
	mov	lr, pc
	bx	ip
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L331+148
	ldr	r1, .L331+152
	ldr	ip, .L331+428
	mov	lr, pc
	bx	ip
	ldr	r1, .L331+340
	strh	r8, [r5, #16]	@ movhi
	mov	r3, #352
	strh	r8, [r5, #18]	@ movhi
	mov	r0, #3
	ldr	r2, .L331+348
	strh	r1, [r5, #10]	@ movhi
	ldr	ip, .L331+428
	ldr	r1, .L331+344
	mov	lr, pc
	bx	ip
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L331+352
	ldr	r1, .L331+356
	ldr	ip, .L331+428
	mov	lr, pc
	bx	ip
	mvn	r2, #111
	ldr	r1, .L331+156
	strh	r8, [r5, #20]	@ movhi
	mov	r3, #288
	strh	r2, [r5, #22]	@ movhi
	mov	r0, #3
	ldr	r2, .L331+160
	strh	r1, [r5, #12]	@ movhi
	ldr	ip, .L331+428
	ldr	r1, .L331+164
	mov	lr, pc
	bx	ip
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L331+168
	ldr	r1, .L331+172
	ldr	ip, .L331+428
	mov	lr, pc
	bx	ip
	mvn	r2, #95
	ldr	r1, .L331+176
	strh	r8, [r5, #24]	@ movhi
	mov	r3, #304
	strh	r2, [r5, #26]	@ movhi
	mov	r0, #3
	ldr	r2, .L331+180
	strh	r1, [r5, #14]	@ movhi
	ldr	ip, .L331+428
	ldr	r1, .L331+184
	mov	lr, pc
	bx	ip
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L331+188
	ldr	r1, .L331+192
	ldr	ip, .L331+428
	mov	lr, pc
	bx	ip
	mov	ip, #13
	ldr	lr, .L331+196
	strh	r8, [r5, #28]	@ movhi
	mov	r3, #16384
	strh	r8, [r5, #30]	@ movhi
	mov	r0, #3
	strb	ip, [lr]
	ldr	r2, .L331+200
	ldr	r1, .L331+204
	ldr	ip, .L331+428
	mov	lr, pc
	bx	ip
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L331+268
	ldr	r1, .L331+208
	ldr	ip, .L331+428
	mov	lr, pc
	bx	ip
	mov	r2, #768
	mov	r3, #16896
	mov	r1, #1088
	ldr	lr, .L331+232
	ldr	r0, [r6, #32]
	ldr	ip, .L331+212
	strh	r2, [lr, #96]	@ movhi
	strh	r3, [lr, #98]	@ movhi
	ldr	r2, .L331+216
	ldr	r3, .L331+220
	strh	r1, [lr, #100]	@ movhi
	strh	ip, [lr]	@ movhi
	strh	r2, [lr, #2]	@ movhi
	strh	r3, [lr, #4]	@ movhi
	mov	r1, #28672
	ldr	r2, .L331+284
	add	r0, r0, #32
	mov	lr, pc
	bx	r2
	mov	lr, #32768
	ldr	r3, .L331+232
	ldr	r0, .L331+224
	strh	r8, [r3, #88]	@ movhi
	ldr	r1, .L331+228
	ldr	r8, .L331+232
	ldr	ip, .L331+236
	ldr	r2, .L331+240
	ldr	r3, .L331+244
	strh	lr, [r8, #90]	@ movhi
	strh	ip, [r8, #92]	@ movhi
	ldr	lr, .L331+248
	ldr	ip, .L331+252
	strh	r1, [r8, #16]	@ movhi
	strh	r1, [r8, #48]	@ movhi
	strh	r1, [r8, #56]	@ movhi
	strh	r1, [r8, #64]	@ movhi
	strh	r1, [r8, #72]	@ movhi
	strh	r0, [r8, #18]	@ movhi
	strh	r0, [r8, #50]	@ movhi
	strh	r0, [r8, #26]	@ movhi
	strh	r0, [r8, #58]	@ movhi
	strh	r0, [r8, #34]	@ movhi
	strh	r0, [r8, #66]	@ movhi
	strh	r0, [r8, #42]	@ movhi
	strh	r0, [r8, #74]	@ movhi
	sub	r1, r1, #12
	ldrsh	r0, [r7, #2]
	strh	r2, [r8, #20]	@ movhi
	strh	r2, [r8, #28]	@ movhi
	strh	r2, [r8, #36]	@ movhi
	strh	r2, [r8, #44]	@ movhi
	strh	lr, [r8, #24]	@ movhi
	strh	ip, [r8, #32]	@ movhi
	strh	r1, [r8, #40]	@ movhi
	strh	r3, [r8, #52]	@ movhi
	strh	r3, [r8, #60]	@ movhi
	strh	r3, [r8, #68]	@ movhi
	strh	r3, [r8, #76]	@ movhi
	ldr	r3, .L331+276
	mov	lr, pc
	bx	r3
	ldr	r0, [r7, #4]
	ldr	r3, .L331+368
	mov	lr, pc
	bx	r3
	ldrb	r0, [r6, #20]	@ zero_extendqisi2
	ldr	r3, .L331+256
	mov	lr, pc
	bx	r3
	ldrb	r1, [r6, #21]	@ zero_extendqisi2
	ldrb	r0, [r6, #22]	@ zero_extendqisi2
	ldr	r3, .L331+260
	mov	lr, pc
	bx	r3
	strh	r9, [r5]	@ movhi
.L143:
	ldr	r1, [r7, #24]
	add	r2, r1, r1, lsl #4
	add	r2, r2, r2, lsl #8
	ldr	r3, .L331+264
	add	r2, r2, r2, lsl #16
	rsb	r2, r2, #0
	cmp	r3, r2, ror #1
	lsl	r3, r1, #4
	bcc	.L144
	ldrsh	r2, [r7]
	cmp	r2, #0
	moveq	r0, #1
	movne	r2, #0
	moveq	r2, #896
	moveq	ip, #83886080
	movne	ip, #83886080
	strheq	r0, [r7]	@ movhi
	ldrne	r0, .L331+268
	ldreq	r0, .L331+268
	strhne	r2, [r7]	@ movhi
	strh	r2, [ip, #26]	@ movhi
	strh	r2, [r0, #18]	@ movhi
.L144:
	add	r3, r3, r1
	add	r3, r3, r3, lsl #8
	ldr	r2, .L331+272
	add	r3, r3, r3, lsl #16
	rsb	r3, r3, #0
	cmp	r2, r3, ror #2
	bcc	.L146
	ldrsh	r0, [r7, #2]
	cmp	r0, #0
	blt	.L308
.L147:
	ldr	r3, .L331+276
	mov	lr, pc
	bx	r3
	ldrh	r3, [r7, #2]
	sub	r3, r3, #1
	strh	r3, [r7, #2]	@ movhi
.L146:
	ldr	r3, .L331+392
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L149
	ldr	r3, .L331+280
	ldrh	r3, [r3, #48]
	tst	r3, #64
	beq	.L309
.L150:
	ldr	r3, .L331+280
	ldrh	r3, [r3, #48]
	tst	r3, #128
	beq	.L310
.L151:
	ldr	r3, .L331+280
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L152
	ldr	r3, .L331+392
	ldrb	r1, [r6, #36]	@ zero_extendqisi2
	ldrsh	r2, [r3, #6]
	adds	r3, r2, r1
	bmi	.L297
.L155:
	ldr	r1, .L331+364
	rsbs	r2, r3, #0
	and	r2, r2, r1
	and	r3, r3, r1
	rsbpl	r3, r2, #0
	ldr	r2, .L331+392
	strh	r3, [r2, #6]	@ movhi
.L149:
	ldrh	r3, [r10]
	tst	r3, #1
	beq	.L156
	ldrh	r2, [fp]
	ands	r2, r2, #1
	beq	.L311
.L156:
	tst	r3, #2
	beq	.L157
	ldrh	r2, [fp]
	ands	r2, r2, #2
	beq	.L312
.L157:
	tst	r3, #8
	beq	.L158
	ldrh	r3, [fp]
	tst	r3, #8
	beq	.L313
.L158:
	ldr	r3, .L331+392
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L314
	cmp	r3, #2
	beq	.L315
.L161:
	ldr	r4, .L331+392
	mov	r1, #112
	ldrb	r2, [r4]	@ zero_extendqisi2
	mov	r0, #12
	ldr	r3, .L331+436
	mov	lr, pc
	bx	r3
	ldrsh	r3, [r4, #6]
	add	r2, r3, #31
	cmp	r3, #0
	movlt	r3, r2
	asr	r3, r3, #5
	rsbs	r2, r3, #0
	and	r2, r2, #15
	and	r3, r3, #15
	rsbpl	r3, r2, #0
	add	r3, r6, r3, lsl #1
	ldrh	r1, [r3, #40]
	ldr	r0, [r6, #32]
	lsl	r1, r1, #23
	ldr	r3, .L331+284
	lsr	r1, r1, #16
	add	r0, r0, #32
	mov	lr, pc
	bx	r3
	ldr	r2, [r7, #24]
	add	r3, r2, r2, lsl #1
	add	r3, r3, r3, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	add	r3, r2, r3, lsl #2
	ldr	r1, .L331+288
	ldr	r2, [r7, #8]
	ldr	r4, [r7, #20]
	cmp	r3, r1
	sub	r4, r2, r4, asr #2
	add	r3, r4, #254
	addls	r2, r2, #1
	strls	r2, [r7, #8]
	cmp	r3, #508
	ldrsh	r2, [r6, #72]
	bhi	.L174
	lsl	r1, r4, #16
	ldr	r3, .L331+436
	mov	r0, #11
	asr	r1, r1, #16
	mov	lr, pc
	bx	r3
	ldr	r2, .L331+392
	ldr	r3, [r6, #72]
	ldrb	r2, [r2]	@ zero_extendqisi2
	add	r3, r3, #21
	cmp	r2, r3
	movhi	r3, #1
	movls	r3, #0
	cmp	r2, #64
	movhi	r3, #0
	cmp	r3, #0
	bne	.L316
.L176:
	ldr	r3, [r7, #20]
	asr	r3, r3, #2
	rsb	r3, r3, #144
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	lsr	r2, r3, #8
	lsl	r4, r2, #7
	sub	r4, r4, r2
	lsl	r4, r4, #25
	orr	r4, r3, r4, asr #16
	mov	r2, #86
	ldr	r3, .L331+436
	mov	r1, r4
	mov	r0, #0
	mov	lr, pc
	bx	r3
	lsl	r3, r4, #16
	lsr	r3, r3, #16
	sub	r2, r3, #98
	cmp	r2, #16
	bhi	.L179
	ldrsh	r5, [r6, #22]
	lsl	r3, r5, #16
	lsr	r3, r3, #16
	cmp	r3, #3
	ldrb	r8, [r6, #21]	@ zero_extendqisi2
	bls	.L317
.L216:
	mov	r3, #0
	strb	r3, [r7, #12]
.L197:
	sub	r2, r5, r8
	rsbs	r3, r2, #0
	adc	r3, r3, r2
	cmp	r4, #97
	cmple	r5, r8
	beq	.L318
	cmp	r4, #116
	movle	r3, #0
	andgt	r3, r3, #1
	cmp	r3, #0
	bne	.L319
.L198:
	cmn	r5, #1
	beq	.L204
	cmp	r5, #0
	beq	.L320
	cmp	r5, #1
	beq	.L321
	cmp	r5, #2
	beq	.L322
	cmp	r5, #3
	beq	.L323
	cmp	r5, #4
	bne	.L296
.L204:
	mov	r0, #0
	ldr	r3, .L331+292
	mov	lr, pc
	bx	r3
	ldrh	r5, [fp]
	b	.L137
.L299:
	ldr	r3, .L331+332
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldrb	r3, [r6]	@ zero_extendqisi2
	strb	r2, [r6]
	ldr	r2, .L331+384
	ldrh	r5, [fp]
	strb	r3, [r2]
	ldrh	r3, [r10]
	b	.L136
.L304:
	ldr	r1, .L331+384
	ldrb	r3, [r1]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L206
	ldr	ip, .L331+428
	mov	r5, #67108864
	mov	r8, ip
	ldr	r2, .L331+296
	strb	r4, [r1]
	mov	r3, #1280
	strh	r2, [r5, #10]	@ movhi
	mov	r0, r4
	ldr	r2, .L331+348
	ldr	r1, .L331+300
	mov	lr, pc
	bx	ip
	mov	r3, #1024
	ldr	r2, .L331+352
	mov	r0, r4
	mov	ip, r8
	ldr	r1, .L331+304
	mov	lr, pc
	bx	ip
	mvn	r3, #15
	mov	r2, #0
	strh	r3, [r5, #20]	@ movhi
	strh	r3, [r5, #22]	@ movhi
	strh	r2, [r7]	@ movhi
	ldrh	r5, [fp]
.L206:
	ldrh	r3, [r10]
	tst	r3, #1
	beq	.L207
	tst	r5, #1
	bne	.L207
	ldrsh	r2, [r7]
	cmp	r2, #0
	bne	.L210
.L325:
	mov	r1, #2
	ldrb	r2, [r6]	@ zero_extendqisi2
	strb	r1, [r6]
	ldr	r1, .L331+384
	strb	r2, [r1]
.L209:
	tst	r3, #64
	beq	.L211
	ands	r2, r5, #64
	bne	.L211
	ldrsh	r1, [r7]
	cmp	r1, #1
	strheq	r2, [r7]	@ movhi
.L211:
	tst	r3, #128
	beq	.L137
	ldrh	r2, [r7]
	and	r3, r5, #128
	orrs	r3, r2, r3
	moveq	r3, #1
	strheq	r3, [r7]	@ movhi
	b	.L137
.L179:
	cmn	r4, #63
	ldrsh	r5, [r6, #22]
	bge	.L186
	ldrb	r2, [r7, #12]	@ zero_extendqisi2
	ldr	r0, .L331+392
	cmp	r2, #1
	ldrsh	r1, [r0, #2]
	beq	.L187
	cmp	r1, #0
	ble	.L324
.L188:
	cmp	r5, #3
	ble	.L190
	mov	r2, #4
	mov	r3, #1
	strh	r2, [r6, #22]	@ movhi
	strb	r3, [r7, #12]
	b	.L204
.L174:
	mvn	r1, #253
	mov	r0, #11
	ldr	r3, .L331+436
	mov	lr, pc
	bx	r3
	b	.L176
.L207:
	tst	r3, #8
	beq	.L209
	tst	r5, #8
	bne	.L209
	ldrsh	r2, [r7]
	cmp	r2, #0
	beq	.L325
.L210:
	cmp	r2, #1
	bne	.L209
	mov	r4, #0
	ldrb	r2, [r6]	@ zero_extendqisi2
	ldr	r3, .L331+380
	ldr	r1, .L331+384
	mov	r0, #4
	strb	r2, [r1]
	strh	r4, [r3, #8]	@ movhi
	ldr	r3, .L331+388
	mov	lr, pc
	bx	r3
	strb	r4, [r6]
	ldrh	r3, [r10]
	ldrh	r5, [fp]
	b	.L209
.L314:
	ldr	r3, .L331+308
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	ldr	r3, [r7, #20]
	asr	r2, r3, #3
	asr	r3, r3, #2
	lsl	r2, r2, #16
	lsl	r3, r3, #16
	lsr	r2, r2, #16
	lsr	r3, r3, #16
	strh	r2, [r1, #24]	@ movhi
	strh	r3, [r1, #20]	@ movhi
	b	.L161
.L320:
	mov	r0, r5
	ldr	r3, .L331+416
	mov	lr, pc
	bx	r3
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L331+420
	ldr	r1, .L331+312
	ldr	ip, .L331+428
	mov	lr, pc
	bx	ip
	ldrh	r5, [fp]
	b	.L137
.L305:
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L331+316
	ldr	ip, .L331+428
	mov	r0, #3
	mov	lr, pc
	bx	ip
	ldr	r5, .L331+320
	ldr	r0, .L331+328
	ldr	r8, .L331+324
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r8
	ldr	r0, .L331+328
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r8
	ldrh	r3, [r10]
	tst	r3, #1
	ldrh	r5, [fp]
	beq	.L137
	ands	r8, r5, #1
	bne	.L137
	ldrb	r2, [r6]	@ zero_extendqisi2
	ldr	r3, .L331+380
	ldr	r1, .L331+384
	mov	r0, r4
	strb	r2, [r1]
	strh	r8, [r3, #8]	@ movhi
	ldr	r3, .L331+388
	mov	lr, pc
	bx	r3
	strb	r8, [r6]
	ldrh	r5, [fp]
	b	.L137
.L187:
	cmp	r1, #0
	blt	.L326
.L186:
	add	r3, r3, #63
	ldr	r2, .L331+376
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	cmp	r3, r2
	bls	.L294
	ldrb	r3, [r7, #12]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L198
	ldrb	r8, [r6, #21]	@ zero_extendqisi2
	b	.L197
.L152:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L149
	ldr	r3, .L331+392
	ldrb	r1, [r6, #36]	@ zero_extendqisi2
	ldrsh	r2, [r3, #6]
	subs	r3, r2, r1
	rsb	r1, r1, #0
	bpl	.L155
.L297:
	add	r3, r2, #508
	add	r3, r3, #3
	lsl	r3, r3, #16
	asr	r3, r3, #16
	add	r3, r3, r1
	b	.L155
.L306:
	ldr	r3, .L331+332
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldrb	r3, [r6]	@ zero_extendqisi2
	strb	r2, [r6]
	ldr	r2, .L331+384
	ldrh	r5, [fp]
	strb	r3, [r2]
	ldrh	r3, [r10]
	b	.L140
.L307:
	ldr	r3, .L331+336
	mov	lr, pc
	bx	r3
	ldr	ip, .L331+428
	mov	r5, #67108864
	mov	r9, ip
	ldr	r2, .L331+340
	mov	r3, #352
	mov	r0, r8
	strh	r2, [r5, #10]	@ movhi
	ldr	r1, .L331+344
	ldr	r2, .L331+348
	mov	lr, pc
	bx	ip
	mov	r3, #2048
	ldr	r2, .L331+352
	mov	r0, r8
	mov	ip, r9
	ldr	r1, .L331+356
	mov	lr, pc
	bx	ip
	mov	r2, #0
	mvn	r3, #111
	strh	r2, [r5, #20]	@ movhi
	strh	r3, [r5, #22]	@ movhi
	b	.L143
.L311:
	ldrb	r1, [r6]	@ zero_extendqisi2
	ldr	r3, .L331+380
	ldr	r0, .L331+384
	strb	r1, [r0]
	strh	r2, [r3, #8]	@ movhi
	mov	r0, #4
	ldr	r3, .L331+388
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldrh	r3, [r10]
	strb	r2, [r6]
	b	.L156
.L312:
	ldrb	r1, [r6]	@ zero_extendqisi2
	ldr	r3, .L331+380
	ldr	r0, .L331+384
	strb	r1, [r0]
	strh	r2, [r3, #8]	@ movhi
	mov	r0, #4
	ldr	r3, .L331+388
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldrh	r3, [r10]
	strb	r2, [r6]
	b	.L157
.L310:
	ldr	r3, .L331+360
	mov	lr, pc
	bx	r3
	b	.L151
.L309:
	ldr	r3, .L331+360
	mov	lr, pc
	bx	r3
	b	.L150
.L315:
	ldr	r3, .L331+392
	ldrsh	r2, [r3, #6]
	cmp	r2, #0
	add	ip, r2, #31
	movge	ip, r2
	mov	r1, #67108864
	ldr	r3, [r7, #8]
	sub	r3, r3, #104
	lsl	r3, r3, #2
	asr	r0, r3, #3
	str	r3, [r7, #20]
	lsl	r0, r0, #16
	lsl	r3, r3, #14
	lsr	r0, r0, #16
	lsr	r3, r3, #16
	tst	ip, #480
	strh	r0, [r1, #24]	@ movhi
	strh	r3, [r1, #20]	@ movhi
	beq	.L163
	ldrb	r1, [r6, #36]	@ zero_extendqisi2
	adds	r3, r2, r1
	addmi	r3, r2, #508
	addmi	r3, r3, #3
	lslmi	r3, r3, #16
	asrmi	r3, r3, #16
	addmi	r3, r3, r1
	ldr	r1, .L331+364
	rsbs	r2, r3, #0
	and	r2, r2, r1
	and	r3, r3, r1
	rsbpl	r3, r2, #0
	ldr	r2, .L331+392
	strh	r3, [r2, #6]	@ movhi
.L163:
	ldr	r1, [r7, #24]
	ldr	r3, .L331+372
	umull	r2, r3, r1, r3
	ldr	r0, .L331+392
	ldrb	r2, [r0]	@ zero_extendqisi2
	lsr	r3, r3, #3
	add	r3, r3, r3, lsl #2
	cmp	r2, #35
	sub	r3, r1, r3, lsl #1
	beq	.L165
	cmp	r3, #0
	bne	.L167
	sub	r3, r2, #1
	and	r3, r3, #255
	cmp	r3, #35
	strb	r3, [r0]
	beq	.L219
.L167:
	ldrb	r3, [r6, #21]	@ zero_extendqisi2
	add	r2, r7, r3
	ldrb	r1, [r2, #16]	@ zero_extendqisi2
	ldrb	r2, [r7, #13]	@ zero_extendqisi2
	cmp	r1, r2
	beq	.L170
	cmp	r2, #0
	beq	.L161
	ldr	r0, [r7, #4]
	ldr	r3, .L331+368
	add	r0, r0, #1
	str	r0, [r7, #4]
	mov	lr, pc
	bx	r3
	b	.L161
.L317:
	cmp	r5, r8
	bne	.L216
	ldr	r2, [r7, #24]
	ldr	r3, .L331+372
	umull	r1, r3, r2, r3
	ldr	r1, .L331+392
	ldrb	r1, [r1]	@ zero_extendqisi2
	lsr	r3, r3, #3
	add	r3, r3, r3, lsl #2
	cmp	r1, #102
	sub	r3, r2, r3, lsl #1
	bhi	.L327
.L181:
	cmp	r3, #0
	bne	.L293
	add	r3, r7, r8
	ldrb	r3, [r3, #16]	@ zero_extendqisi2
	cmp	r3, #0
	mov	r0, r8
	bne	.L185
	mov	r1, #2
	ldr	r3, .L331+404
	mov	lr, pc
	bx	r3
.L293:
	ldrsh	r5, [r6, #22]
	ldrb	r8, [r6, #21]	@ zero_extendqisi2
	b	.L216
.L324:
	ldrb	r0, [r0, #8]	@ zero_extendqisi2
	cmp	r0, #2
	beq	.L188
	cmp	r2, #2
	bne	.L187
	add	r3, r3, #63
	ldr	r2, .L331+376
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	cmp	r3, r2
	bhi	.L198
.L294:
	ldrb	r8, [r6, #21]	@ zero_extendqisi2
	b	.L216
.L308:
	mov	r2, #0
	ldrb	r1, [r6]	@ zero_extendqisi2
	ldr	r3, .L331+380
	ldr	r0, .L331+384
	strb	r1, [r0]
	mov	r0, #4
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L331+388
	mov	lr, pc
	bx	r3
	mov	r3, #5
	ldrsh	r0, [r7, #2]
	strb	r3, [r6]
	b	.L147
.L316:
	sub	r3, r4, #100
	cmp	r3, #8
	bhi	.L176
	ldrb	r3, [r6, #21]	@ zero_extendqisi2
	add	r3, r7, r3
	ldrb	r3, [r3, #16]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L176
	cmp	r4, #103
	bgt	.L177
	mvn	r2, #119
	mov	r3, #0
	ldr	r1, .L331+392
	strh	r2, [r1, #2]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	b	.L176
.L190:
	mov	r3, #1
	add	r5, r5, r3
	lsl	r5, r5, #16
	asr	r5, r5, #16
	strh	r5, [r6, #22]	@ movhi
	strb	r3, [r7, #12]
	b	.L198
.L321:
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L331+420
	ldr	r1, .L331+396
	ldr	ip, .L331+428
	mov	lr, pc
	bx	ip
	ldrh	r5, [fp]
	b	.L137
.L326:
	cmp	r5, #0
	blt	.L328
	mov	r3, #2
	sub	r5, r5, #1
	lsl	r5, r5, #16
	asr	r5, r5, #16
	strh	r5, [r6, #22]	@ movhi
	strb	r3, [r7, #12]
	b	.L198
.L322:
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L331+420
	ldr	r1, .L331+400
	ldr	ip, .L331+428
	mov	lr, pc
	bx	ip
	ldrh	r5, [fp]
	b	.L137
.L318:
	add	r3, r7, r8
	ldrb	r3, [r3, #16]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L198
	mov	r0, r8
	mov	r1, #1
	ldr	r3, .L331+404
	mov	lr, pc
	bx	r3
	ldrsh	r5, [r6, #22]
	b	.L198
.L319:
	add	r3, r7, r8
	ldrb	r1, [r3, #16]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L198
	mov	r0, r8
	ldr	r3, .L331+404
	mov	lr, pc
	bx	r3
	ldrsh	r5, [r6, #22]
	b	.L198
.L313:
	ldr	r3, .L331+408
	mov	lr, pc
	bx	r3
.L159:
	mov	r0, r4
	add	r4, r4, #1
	ldr	r3, .L331+416
	and	r4, r4, #255
	mov	lr, pc
	bx	r3
	cmp	r4, #10
	bne	.L159
	mov	r0, #3
	ldr	r3, .L331+412
	mov	lr, pc
	bx	r3
	b	.L158
.L323:
	mov	r0, #0
	ldr	r3, .L331+416
	mov	lr, pc
	bx	r3
	mov	r0, r5
	mov	r3, #16
	ldr	r2, .L331+420
	ldr	r1, .L331+424
	ldr	ip, .L331+428
	mov	lr, pc
	bx	ip
	ldrh	r5, [fp]
	b	.L137
.L165:
	cmp	r3, #0
	bne	.L167
.L219:
	ldrb	r0, [r6, #21]	@ zero_extendqisi2
	add	r3, r7, r0
	ldrb	r3, [r3, #16]	@ zero_extendqisi2
	ldrb	r2, [r7, #13]	@ zero_extendqisi2
	cmp	r3, r2
	addhi	r3, r2, #1
	ldr	r1, .L331+432
	andhi	r3, r3, #255
	str	r1, [sp, #20]
	add	r2, sp, #24
	sub	r1, r3, #49
	add	r2, r2, r0
	lsl	r1, r1, #16
	add	r0, r0, #2
	strb	r3, [r7, #13]
	ldrb	r2, [r2, #-4]	@ zero_extendqisi2
	ldr	r3, .L331+436
	asr	r1, r1, #16
	and	r0, r0, #255
	mov	lr, pc
	bx	r3
	b	.L167
.L328:
	mvn	r2, #0
	mov	r3, #2
	strh	r2, [r6, #22]	@ movhi
	strb	r3, [r7, #12]
	b	.L204
.L170:
	mov	r2, #0
	add	r3, r6, r3
	ldrb	r4, [r3, #24]	@ zero_extendqisi2
	ldr	r3, .L333
	cmp	r4, #255
	strb	r2, [r3, #8]
	beq	.L329
.L172:
	ldr	r3, .L333+4
	mov	r1, r4
	ldrb	r0, [r6, #22]	@ zero_extendqisi2
	strb	r4, [r6, #21]
	mov	lr, pc
	bx	r3
	mov	r3, #0
	strb	r3, [r7, #13]
	b	.L161
.L177:
	cmp	r4, #104
	beq	.L178
	mov	r2, #120
	mov	r3, #0
	ldr	r1, .L333
	strh	r2, [r1, #2]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	b	.L176
.L327:
	cmp	r3, #0
	add	ip, r7, r5
	ldrb	r3, [ip, #16]	@ zero_extendqisi2
	beq	.L330
	cmp	r3, #62
	beq	.L293
.L217:
	ldr	r0, [r7, #4]
	ldr	r3, .L333+8
	add	r0, r0, #1
	str	r0, [r7, #4]
	mov	lr, pc
	bx	r3
	ldrsh	r5, [r6, #22]
.L183:
	ldrb	r8, [r6, #21]	@ zero_extendqisi2
	cmp	r8, r5
	bne	.L216
	ldr	r3, .L333+12
	mov	r1, #10
	ldr	r0, [r7, #24]
	mov	lr, pc
	bx	r3
	mov	r3, r1
	b	.L181
.L178:
	mov	r3, #0
	mov	r2, #2
	ldr	r1, .L333
	strh	r3, [r1, #2]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	strb	r2, [r1, #8]
	b	.L176
.L329:
	ldr	r3, .L333+16
	mov	lr, pc
	bx	r3
	b	.L172
.L330:
	cmp	r3, #61
	movcc	r1, r3
	movcs	r1, #61
	ldr	r3, .L333+20
	add	r1, r1, #1
	str	r3, [sp, #20]
	add	r3, sp, #24
	add	r3, r3, r5
	and	r1, r1, #255
	add	r0, r5, #6
	ldrb	r2, [r3, #-4]	@ zero_extendqisi2
	strb	r1, [ip, #16]
	ldr	r3, .L333+24
	and	r0, r0, #255
	sub	r1, r1, #49
	mov	lr, pc
	bx	r3
	ldrsh	r5, [r6, #22]
	add	r3, r7, r5
	ldrb	r3, [r3, #16]	@ zero_extendqisi2
	cmp	r3, #62
	beq	.L183
	b	.L217
.L185:
	mov	r1, #3
	ldr	r3, .L333+28
	mov	lr, pc
	bx	r3
	ldrsh	r5, [r6, #22]
	ldrb	r8, [r6, #21]	@ zero_extendqisi2
	b	.L216
.L334:
	.align	2
.L333:
	.word	player_ship
	.word	set_compass_target
	.word	set_score
	.word	__aeabi_uidivmod
	.word	next_station.part.0
	.word	-1970240362
	.word	set_sprite_location
	.word	set_compass
	.size	main, .-main
	.global	bg_aff_current
	.global	directions
	.comm	player_ship,10,4
	.global	obj_aff_buffer
	.global	resource_counter
	.global	resource_amount
	.global	turning_speed
	.global	mothership_world_y_coord
	.global	mothership_world_x_coord
	.global	world_offset
	.global	station_order
	.global	current_station
	.global	station_visable
	.global	game_target_station
	.global	game_score
	.global	game_level
	.global	game_counter
	.global	temp_pal
	.comm	oldSTATE,1,1
	.global	STATE
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.global	frameCount
	.global	scanlineCounter
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	STATE, %object
	.size	STATE, 1
STATE:
	.byte	-1
	.space	3
	.type	bg_aff_current, %object
	.size	bg_aff_current, 16
bg_aff_current:
	.short	256
	.short	0
	.short	0
	.short	256
	.word	0
	.word	0
	.type	game_level, %object
	.size	game_level, 1
game_level:
	.byte	1
	.type	game_target_station, %object
	.size	game_target_station, 1
game_target_station:
	.byte	1
	.type	current_station, %object
	.size	current_station, 2
current_station:
	.short	1
	.type	station_order, %object
	.size	station_order, 5
station_order:
	.ascii	"\377\003\000\002\001"
	.space	3
	.type	obj_aff_buffer, %object
	.size	obj_aff_buffer, 4
obj_aff_buffer:
	.word	shadowOAM
	.type	turning_speed, %object
	.size	turning_speed, 1
turning_speed:
	.byte	4
	.space	3
	.type	directions, %object
	.size	directions, 32
directions:
	.short	0
	.short	32
	.short	64
	.short	96
	.short	128
	.short	160
	.short	192
	.short	224
	.short	256
	.short	288
	.short	320
	.short	352
	.short	384
	.short	416
	.short	448
	.short	480
	.type	mothership_world_y_coord, %object
	.size	mothership_world_y_coord, 4
mothership_world_y_coord:
	.word	24
	.type	scanlineCounter, %object
	.size	scanlineCounter, 4
scanlineCounter:
	.word	67108870
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	temp_pal, %object
	.size	temp_pal, 2
temp_pal:
	.space	2
	.type	game_counter, %object
	.size	game_counter, 2
game_counter:
	.space	2
	.type	game_score, %object
	.size	game_score, 4
game_score:
	.space	4
	.type	mothership_world_x_coord, %object
	.size	mothership_world_x_coord, 4
mothership_world_x_coord:
	.space	4
	.type	station_visable, %object
	.size	station_visable, 1
station_visable:
	.space	1
	.type	resource_counter, %object
	.size	resource_counter, 1
resource_counter:
	.space	1
	.space	2
	.type	resource_amount, %object
	.size	resource_amount, 4
resource_amount:
	.space	4
	.type	world_offset, %object
	.size	world_offset, 4
world_offset:
	.space	4
	.type	frameCount, %object
	.size	frameCount, 4
frameCount:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
