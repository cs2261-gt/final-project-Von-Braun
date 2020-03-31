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
	.global	hbl_pal_invert
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	hbl_pal_invert, %function
hbl_pal_invert:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #83886080
	mov	r0, #2
	ldrh	r3, [r2, #12]
	ldr	r1, .L3
	eor	r3, r3, #32512
	eor	r3, r3, #255
	strh	r3, [r2, #12]	@ movhi
	strh	r0, [r1, #2]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	67109376
	.size	hbl_pal_invert, .-hbl_pal_invert
	.align	2
	.global	hbl_pal_invert_vcnt
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
	ldr	r2, .L10
	ldr	r4, .L10+4
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L10+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L10+12
	ldrsh	r2, [r3]
	cmp	r2, #1
	bne	.L6
	mov	r1, #83886080
	ldrh	r0, [r1, #16]
	strh	r0, [r3]	@ movhi
	ldrh	r0, [r1, #20]
	strh	r0, [r1, #16]	@ movhi
	ldrh	r0, [r3]
	strh	r0, [r1, #20]	@ movhi
	strh	r2, [r3]	@ movhi
.L6:
	mov	r2, #67108864
.L7:
	ldrh	r3, [r2, #6]
	cmp	r3, #89
	bls	.L7
	mov	r3, #16
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L10
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L10+16
	pop	{r4, lr}
	strh	r2, [r3, #2]	@ movhi
	bx	lr
.L11:
	.align	2
.L10:
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
	@ link register save eliminated.
	ldr	r1, .L20
	ldrb	r3, [r1, #2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L13
	cmp	r0, #4
	bxne	lr
	ldr	r3, .L20+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	sub	r3, r3, #2
	cmp	r3, #1
	bxhi	lr
.L13:
	mov	r0, #1
	mov	r3, #83886080
	mov	r2, #0
	strb	r0, [r1, #2]
	ldr	r1, .L20+8
.L15:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L15
	mov	r3, #67108864
	ldr	r1, .L20+12
	strh	r2, [r3, #12]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #24]	@ movhi
	strh	r2, [r3, #26]	@ movhi
	bx	lr
.L21:
	.align	2
.L20:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	83886592
	.word	1044
	.size	switch_graphics_mode, .-switch_graphics_mode
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
	ldr	r4, .L24
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L25:
	.align	2
.L24:
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
	ldr	r5, .L33
	ldr	r3, .L33+4
	ldrb	r2, [r5]	@ zero_extendqisi2
	cmp	r0, #2
	mov	r4, r0
	strb	r2, [r3]
	beq	.L31
	cmp	r0, #3
	beq	.L32
	mov	r2, #0
	ldr	r3, .L33+8
	mov	r0, #4
	strh	r2, [r3, #8]	@ movhi
	bl	switch_graphics_mode
	strb	r4, [r5]
	pop	{r4, r5, r6, lr}
	bx	lr
.L32:
	mov	r2, #67108864
	mov	r0, #1
	ldrh	r3, [r2, #4]
	and	r3, r3, #255
	orr	r3, r3, #7168
	strh	r3, [r2, #4]	@ movhi
	ldrh	r3, [r2, #4]
	orr	r3, r3, #32
	strh	r3, [r2, #4]	@ movhi
	ldr	r3, .L33+8
	ldrh	r2, [r3]
	orr	r2, r2, #4
	strh	r2, [r3]	@ movhi
	ldr	r1, .L33+12
	ldr	r2, .L33+16
	strh	r0, [r3, #8]	@ movhi
	str	r2, [r1, #4092]
.L31:
	mov	r0, #0
	bl	switch_graphics_mode
	strb	r4, [r5]
	pop	{r4, r5, r6, lr}
	bx	lr
.L34:
	.align	2
.L33:
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
	sub	sp, sp, #8
	mov	r0, r1
	mov	r2, #160
	str	r3, [sp]
	ldr	r4, .L43
	mov	r3, #240
	mov	lr, pc
	bx	r4
	ldr	r3, .L43+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L43+8
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	sub	r3, r3, #1
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L36
.L38:
	.word	.L41
	.word	.L40
	.word	.L39
	.word	.L37
.L37:
	mov	r2, #500
	ldr	r3, .L43+12
	strh	r2, [r3, #4]	@ movhi
.L36:
	mov	r2, #0
	ldr	r3, .L43+16
	str	r2, [r3]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L41:
	mov	r2, #900
	ldr	r3, .L43+12
	strh	r2, [r3, #4]	@ movhi
	b	.L36
.L40:
	ldr	r3, .L43+12
	ldr	r2, .L43+20
	strh	r2, [r3, #4]	@ movhi
	b	.L36
.L39:
	mov	r2, #600
	ldr	r3, .L43+12
	strh	r2, [r3, #4]	@ movhi
	b	.L36
.L44:
	.align	2
.L43:
	.word	drawRect4
	.word	flipPage
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	mountain_hoff
	.word	750
	.size	initialize_GAME, .-initialize_GAME
	.align	2
	.global	begin_interupts_hblank
	.syntax unified
	.arm
	.fpu softvfp
	.type	begin_interupts_hblank, %function
begin_interupts_hblank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	mov	r1, #1
	ldrh	r3, [r2, #4]
	orr	r3, r3, #16
	strh	r3, [r2, #4]	@ movhi
	ldr	r3, .L46
	ldrh	r2, [r3]
	ldr	r0, .L46+4
	ldr	ip, .L46+8
	orr	r2, r2, #2
	strh	r2, [r3]	@ movhi
	str	ip, [r0, #4092]
	strh	r1, [r3, #8]	@ movhi
	bx	lr
.L47:
	.align	2
.L46:
	.word	67109376
	.word	50360320
	.word	hbl_pal_invert
	.size	begin_interupts_hblank, .-begin_interupts_hblank
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
	ldr	r3, .L49
	ldrh	r2, [r3]
	ldr	r0, .L49+4
	ldr	ip, .L49+8
	orr	r2, r2, #4
	strh	r2, [r3]	@ movhi
	str	ip, [r0, #4092]
	strh	r1, [r3, #8]	@ movhi
	bx	lr
.L50:
	.align	2
.L49:
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
	ldr	r3, .L52
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L53:
	.align	2
.L52:
	.word	67109376
	.size	stop_interupts, .-stop_interupts
	.align	2
	.global	write_sprite_data
	.syntax unified
	.arm
	.fpu softvfp
	.type	write_sprite_data, %function
write_sprite_data:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	lsl	r3, r1, #2
	ldr	r4, .L56
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L56+4
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	DMANow
	.word	shadowOAM
	.size	write_sprite_data, .-write_sprite_data
	.align	2
	.global	set_sprite_location
	.syntax unified
	.arm
	.fpu softvfp
	.type	set_sprite_location, %function
set_sprite_location:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	add	lr, r0, r1, lsl #3
	ldrh	ip, [lr, #2]
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	and	ip, ip, #65024
	orr	ip, ip, r2
	strb	r3, [r0, r1, lsl #3]
	strh	ip, [lr, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
	.size	set_sprite_location, .-set_sprite_location
	.align	2
	.global	hide_all_sprites
	.syntax unified
	.arm
	.fpu softvfp
	.type	hide_all_sprites, %function
hide_all_sprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L67
	ldrb	r2, [r3, #8]	@ zero_extendqisi2
	cmp	r2, #0
	sub	r2, r2, #1
	and	r2, r2, #255
	bxeq	lr
	add	r2, r0, r2, lsl #3
.L62:
	ldrh	r3, [r2]
	bic	r3, r3, #768
	orr	r3, r3, #512
	cmp	r0, r2
	strh	r3, [r2], #-8	@ movhi
	bne	.L62
	bx	lr
.L68:
	.align	2
.L67:
	.word	.LANCHOR0
	.size	hide_all_sprites, .-hide_all_sprites
	.align	2
	.global	hide_sprite
	.syntax unified
	.arm
	.fpu softvfp
	.type	hide_sprite, %function
hide_sprite:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	lsl	r1, r1, #3
	ldrh	r3, [r0, r1]
	bic	r3, r3, #768
	orr	r3, r3, #512
	strh	r3, [r0, r1]	@ movhi
	bx	lr
	.size	hide_sprite, .-hide_sprite
	.align	2
	.global	show_all_sprites
	.syntax unified
	.arm
	.fpu softvfp
	.type	show_all_sprites, %function
show_all_sprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L81
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	cmp	r3, #0
	sub	r3, r3, #1
	and	r3, r3, #255
	bxeq	lr
.L74:
	lsl	r1, r3, #3
	ldrh	r2, [r0, r1]
	cmp	r3, #10
	bic	r2, r2, #768
	strh	r2, [r0, r1]	@ movhi
	orreq	r2, r2, #256
	sub	ip, r3, #1
	strheq	r2, [r0, r1]	@ movhi
	moveq	r3, #9
	beq	.L74
	cmp	r3, #0
	and	r3, ip, #255
	bne	.L74
	bx	lr
.L82:
	.align	2
.L81:
	.word	.LANCHOR0
	.size	show_all_sprites, .-show_all_sprites
	.align	2
	.global	show_sprite
	.syntax unified
	.arm
	.fpu softvfp
	.type	show_sprite, %function
show_sprite:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	lsl	r2, r1, #3
	ldrh	r3, [r0, r2]
	cmp	r1, #10
	bic	r3, r3, #768
	orreq	r3, r3, #256
	strh	r3, [r0, r2]	@ movhi
	bx	lr
	.size	show_sprite, .-show_sprite
	.align	2
	.global	lu_sin
	.syntax unified
	.arm
	.fpu softvfp
	.type	lu_sin, %function
lu_sin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L88
	ldr	r2, .L88+4
	lsr	r0, r0, #6
	and	r3, r3, r0
	ldrsh	r0, [r2, r3]
	bx	lr
.L89:
	.align	2
.L88:
	.word	1022
	.word	sin_lut
	.size	lu_sin, .-lu_sin
	.align	2
	.global	lu_cos
	.syntax unified
	.arm
	.fpu softvfp
	.type	lu_cos, %function
lu_cos:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	lsr	r0, r0, #7
	add	r0, r0, #128
	lsl	r0, r0, #23
	ldr	r3, .L91
	lsr	r0, r0, #23
	lsl	r0, r0, #1
	ldrsh	r0, [r3, r0]
	bx	lr
.L92:
	.align	2
.L91:
	.word	sin_lut
	.size	lu_cos, .-lu_cos
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
	ldr	r4, .L114
	ldr	r1, .L114+4
	ldrsh	r2, [r4, #2]
	smull	r3, r1, r2, r1
	ldr	r0, .L114+8
	add	r1, r1, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #5
	lsl	r3, r3, #16
	ldr	r1, [r0, #12]
	asr	r3, r3, #16
	add	r3, r3, r1
	cmp	r2, #0
	str	r3, [r0, #12]
	ble	.L94
	cmp	r2, #2
	bgt	.L112
.L107:
	mov	r2, #0
.L97:
	strh	r2, [r4, #2]	@ movhi
.L96:
	ldrsh	r5, [r4, #4]
	eor	r3, r5, r5, asr #31
	sub	r3, r3, r5, asr #31
	ldr	r1, .L114+4
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	smull	r2, r1, r3, r1
	add	r1, r1, r3
	asr	r1, r1, #3
	ldr	r3, .L114+12
	ldr	r0, [r0, #16]
	rsb	r1, r1, #16
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	ldrb	r3, [r4]	@ zero_extendqisi2
	bne	.L98
	cmp	r5, #0
	blt	.L113
	beq	.L100
	cmp	r3, #102
	movcs	r3, #102
	add	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #103
	strb	r3, [r4]
	beq	.L101
.L104:
	cmp	r5, #239
	movgt	r5, #240
	bgt	.L103
	b	.L102
.L112:
	sub	r2, r2, #2
	lsl	r2, r2, #16
	asr	r2, r2, #16
	b	.L97
.L113:
	cmp	r3, #104
	movcs	r3, #104
	sub	r3, r3, #1
	and	r3, r3, #255
	strb	r3, [r4]
.L98:
	cmp	r3, #102
	bhi	.L101
	cmn	r5, #241
	mvnlt	r5, #239
	bge	.L104
.L103:
	strh	r5, [r4, #4]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L101:
	mov	r3, #0
	strh	r3, [r4, #4]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L94:
	beq	.L96
	cmn	r2, #2
	bge	.L107
	add	r2, r2, #2
	lsl	r2, r2, #16
	asr	r2, r2, #16
	b	.L97
.L100:
	cmp	r3, #102
	bhi	.L101
.L102:
	add	r5, r5, #1
	lsl	r5, r5, #16
	asr	r5, r5, #16
	b	.L103
.L115:
	.align	2
.L114:
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
	ldr	r1, .L118
	ldrsh	r2, [r1, #6]
	adds	r3, r2, r0
	addmi	r3, r2, #508
	addmi	r3, r3, #3
	lslmi	r3, r3, #16
	asrmi	r3, r3, #16
	addmi	r3, r3, r0
	ldr	r0, .L118+4
	rsbs	r2, r3, #0
	and	r2, r2, r0
	and	r3, r3, r0
	rsbpl	r3, r2, #0
	strh	r3, [r1, #6]	@ movhi
	bx	lr
.L119:
	.align	2
.L118:
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
	ldr	r1, .L133
	ldrsh	r3, [r1, #6]
	add	r2, r3, #31
	cmp	r3, #0
	movlt	r3, r2
	asr	r3, r3, #5
	rsbs	r2, r3, #0
	and	r2, r2, #15
	and	r3, r3, #15
	rsbpl	r3, r2, #0
	ands	r2, r3, #247
	push	{r4, lr}
	ldrsh	ip, [r1, #4]
	ldrsh	lr, [r1, #2]
	and	r3, r3, #255
	bne	.L121
	subs	r2, r3, #4
	submi	r3, r3, #1
	movpl	r3, r2
	bic	r2, r3, #3
	add	r2, r2, ip
	lsl	ip, r2, #16
	asr	ip, ip, #16
.L122:
	cmp	ip, #240
	movlt	r2, ip
	movge	r2, #240
	mvn	ip, #239
	cmp	r2, ip
	movlt	r2, ip
	cmp	lr, #800
	movlt	r3, lr
	movge	r3, #800
	ldr	lr, .L133+4
	cmp	r3, lr
	movlt	r3, lr
	strh	r2, [r1, #4]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L121:
	cmp	r2, #4
	bne	.L123
	subs	r2, r3, #8
	submi	r3, r3, #5
	movpl	r3, r2
	asr	r3, r3, #2
	add	r3, lr, r3, lsl #3
	lsl	lr, r3, #16
	asr	lr, lr, #16
	b	.L122
.L123:
	cmp	r3, #15
	cmpne	r3, #1
	beq	.L131
	sub	r2, r3, #3
	tst	r2, #253
	bne	.L125
	sub	r3, r3, #4
	add	r2, ip, r3, lsl #1
	sub	r3, lr, #8
	lsl	ip, r2, #16
	lsl	lr, r3, #16
	asr	ip, ip, #16
	asr	lr, lr, #16
	b	.L122
.L131:
	ldr	r2, .L133+8
	sub	r3, r3, #8
	smull	r0, r2, r3, r2
	add	r2, r2, r3
	asr	r3, r3, #31
	rsb	r3, r3, r2, asr #2
	add	r3, lr, r3, lsl #2
	sub	r2, ip, #4
	lsl	ip, r2, #16
	lsl	lr, r3, #16
	asr	ip, ip, #16
	asr	lr, lr, #16
	b	.L122
.L125:
	sub	r2, r3, #11
	tst	r2, #253
	beq	.L132
	sub	r2, r3, #7
	tst	r2, #253
	subeq	r0, r3, #8
	addeq	r3, lr, r0, lsl #2
	beq	.L130
	cmp	r3, #14
	cmpne	r3, #2
	bne	.L128
	ldr	r2, .L133+12
	sub	r0, r3, #8
	smull	r4, r3, r2, r0
	sub	r3, r3, r0, asr #31
	sub	r2, ip, #4
	add	r3, lr, r3, lsl #3
	lsl	ip, r2, #16
	lsl	lr, r3, #16
	asr	ip, ip, #16
	asr	lr, lr, #16
	b	.L122
.L132:
	lsl	r2, r3, #1
	rsb	r2, r2, #24
	add	r2, r2, ip
	add	r3, lr, #8
	lsl	ip, r2, #16
	lsl	lr, r3, #16
	asr	ip, ip, #16
	asr	lr, lr, #16
	b	.L122
.L128:
	sub	r2, r3, #6
	tst	r2, #251
	bne	.L122
	sub	r0, r3, #8
	add	r3, r0, r0, lsr #31
	asr	r3, r3, #1
	add	r3, lr, r3, lsl #3
.L130:
	add	r2, ip, #4
	lsl	lr, r3, #16
	lsl	ip, r2, #16
	asr	lr, lr, #16
	asr	ip, ip, #16
	b	.L122
.L134:
	.align	2
.L133:
	.word	player_ship
	.word	-800
	.word	-1840700269
	.word	715827883
	.size	activate_thrusters, .-activate_thrusters
	.align	2
	.global	overwrite_BG_tile
	.syntax unified
	.arm
	.fpu softvfp
	.type	overwrite_BG_tile, %function
overwrite_BG_tile:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	lsl	r0, r0, #6
	ldr	lr, [sp, #8]
	lsl	ip, r1, #5
	add	r0, r0, #100663296
	add	r0, r0, #65536
	add	ip, ip, #100663296
	add	r1, r0, r2, lsl #2
	ldr	r4, .L137
	add	r2, ip, r3, lsl #2
	mov	r0, #3
	lsl	r3, lr, #1
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L138:
	.align	2
.L137:
	.word	DMANow
	.size	overwrite_BG_tile, .-overwrite_BG_tile
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
	ldr	r2, .L143
	ldr	r1, .L143+4
	smull	r3, r2, r0, r2
	smull	ip, r3, r1, r0
	push	{r4, r5, r6, r7, r8, lr}
	asr	lr, r0, #31
	rsb	r2, lr, r2, asr #5
	lsl	r2, r2, #16
	rsb	lr, lr, r3, asr #2
	lsl	ip, lr, #16
	asr	r3, r2, #16
	smull	r4, r5, r1, r3
	asr	r4, ip, #16
	smull	r6, r1, r4, r1
	asr	r2, r2, #31
	rsb	r2, r2, r5, asr #2
	asr	ip, ip, #31
	add	r2, r2, r2, lsl #2
	rsb	r1, ip, r1, asr #2
	add	lr, lr, lr, lsl #2
	sub	r3, r3, r2, lsl #1
	add	r1, r1, r1, lsl #2
	sub	sp, sp, #8
	sub	r1, r4, r1, lsl #1
	sub	lr, r0, lr, lsl #1
	and	r3, r3, #255
	strb	lr, [sp, #6]
	strb	r3, [sp, #4]
	strb	r1, [sp, #5]
	ldr	r4, .L143+8
	ldr	r6, .L143+12
	ldr	r8, .L143+16
	add	r7, sp, #5
.L141:
	ldr	r5, .L143+20
	lsl	r3, r3, #10
	add	r5, r3, r5
	mov	r2, r4
	mov	r1, r5
	mov	r3, #6
	mov	r0, #3
	mov	lr, pc
	bx	r6
	add	r2, r4, #588
	mov	r3, #10
	mov	r0, #3
	add	r1, r5, #12
	add	r4, r4, #32
	mov	lr, pc
	bx	r6
	cmp	r4, r8
	ldrbne	r3, [r7], #1	@ zero_extendqisi2
	bne	.L141
.L139:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L144:
	.align	2
.L143:
	.word	1374389535
	.word	1717986919
	.word	100667348
	.word	DMANow
	.word	100667444
	.word	100729344
	.size	set_counter, .-set_counter
	.align	2
	.global	set_score
	.syntax unified
	.arm
	.fpu softvfp
	.type	set_score, %function
set_score:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L150
	lsr	r3, r0, #5
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r2, .L150+4
	umull	r4, r3, r1, r3
	ldr	lr, .L150+8
	ldr	ip, .L150+12
	ldr	r1, .L150+16
	umull	r4, lr, r0, lr
	umull	r4, ip, r0, ip
	umull	r4, r1, r0, r1
	umull	r5, r4, r2, r0
	lsr	r3, r3, #7
	lsr	r4, r4, #3
	lsr	lr, lr, #13
	lsr	ip, ip, #6
	lsr	r1, r1, #5
	umull	r5, r8, r2, r3
	umull	r5, r7, r2, lr
	umull	r5, r6, r2, ip
	umull	r9, r5, r2, r1
	umull	r9, r2, r4, r2
	lsr	r8, r8, #3
	lsr	r2, r2, #3
	add	r8, r8, r8, lsl #2
	lsr	r7, r7, #3
	lsr	r6, r6, #3
	lsr	r5, r5, #3
	add	r2, r2, r2, lsl #2
	sub	r3, r3, r8, lsl #1
	add	r7, r7, r7, lsl #2
	add	r6, r6, r6, lsl #2
	add	r5, r5, r5, lsl #2
	sub	r2, r4, r2, lsl #1
	add	r4, r4, r4, lsl #2
	sub	sp, sp, #12
	sub	lr, lr, r7, lsl #1
	sub	ip, ip, r6, lsl #1
	sub	r1, r1, r5, lsl #1
	and	r3, r3, #255
	sub	r0, r0, r4, lsl #1
	strb	r3, [sp]
	strb	lr, [sp, #1]
	strb	ip, [sp, #2]
	strb	r1, [sp, #3]
	strb	r2, [sp, #4]
	strb	r0, [sp, #5]
	ldr	r5, .L150+20
	ldr	r6, .L150+24
	ldr	r8, .L150+28
	add	r7, sp, #1
	b	.L147
.L149:
	ldrb	r3, [r7], #1	@ zero_extendqisi2
	add	r5, r5, #32
.L147:
	ldr	r4, .L150+32
	lsl	r3, r3, #10
	add	r4, r3, r4
	mov	r1, r4
	mov	r3, #6
	mov	r2, r5
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	r3, #10
	mov	r0, #3
	add	r1, r4, #12
	add	r2, r5, #844
	mov	lr, pc
	bx	r6
	cmp	r5, r8
	bne	.L149
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L151:
	.align	2
.L150:
	.word	175921861
	.word	-858993459
	.word	-776530087
	.word	274877907
	.word	1374389535
	.word	100663732
	.word	DMANow
	.word	100663892
	.word	100729344
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
	ldr	r4, .L154
	lsl	r0, r0, #10
	add	r4, r0, r4
	mov	r1, r4
	ldr	r5, .L154+4
	mov	r3, #6
	mov	r0, #3
	ldr	r2, .L154+8
	mov	lr, pc
	bx	r5
	add	r1, r4, #12
	mov	r3, #10
	mov	r0, #3
	ldr	r2, .L154+12
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L155:
	.align	2
.L154:
	.word	100729408
	.word	DMANow
	.word	100664148
	.word	100665024
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
	mov	r4, r1
	ldr	r7, .L158
	lsl	r0, r0, #10
	add	r7, r0, r7
	ldr	r6, .L158+4
	ldr	r5, .L158+8
	mov	r1, r7
	mov	r3, #6
	mov	r0, #3
	ldr	r2, .L158+12
	lsl	r4, r4, #10
	mov	lr, pc
	bx	r5
	add	r6, r4, r6
	add	r1, r7, #12
	mov	r3, #10
	mov	r0, #3
	ldr	r2, .L158+16
	mov	lr, pc
	bx	r5
	mov	r1, r6
	mov	r3, #6
	mov	r0, #3
	ldr	r2, .L158+20
	mov	lr, pc
	bx	r5
	add	r1, r6, #12
	mov	r3, #10
	mov	r0, #3
	ldr	r2, .L158+24
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L159:
	.align	2
.L158:
	.word	100729472
	.word	100729536
	.word	DMANow
	.word	100663604
	.word	100664448
	.word	100663636
	.word	100664480
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
	bhi	.L163
	bxcs	lr
	mov	r0, r1
	mov	r1, #1
	b	set_compass
.L163:
	mov	r0, r1
	mov	r1, #0
	b	set_compass
	.size	set_compass_target, .-set_compass_target
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 1088
	@ frame_needed = 0, uses_anonymous_args = 0
	mvn	r2, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r0, #0
	mov	r4, #1
	ldr	r6, .L330
	ldr	r3, .L330+4
	strh	r2, [r6]	@ movhi
	ldr	r10, .L330+8
	ldrh	r3, [r3, #48]
	sub	sp, sp, #1088
	sub	sp, sp, #4
	strh	r3, [r10]	@ movhi
	ldr	r3, .L330+12
	str	r4, [sp, #4]
	str	r0, [sp, #24]
	str	r0, [sp, #8]
	ldr	r9, .L330+16
	mov	lr, pc
	bx	r3
	ldr	fp, .L330+20
	str	r4, [sp, #20]
	ldr	r5, .L330+24
	add	r4, sp, #64
	b	.L234
.L305:
	ldr	r2, .L330+28
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L303
.L166:
	ldrh	r2, [r6]
	tst	r2, #1
	beq	.L167
	ands	r7, r3, #1
	beq	.L304
.L167:
	tst	r2, #2
	beq	.L168
	tst	r3, #2
	bne	.L168
	ldr	r3, .L330+12
	mov	r0, #1
	mov	lr, pc
	bx	r3
	ldrh	r3, [r10]
.L168:
	ldr	r2, [r5, #16]
	add	r2, r2, #1
	strh	r3, [r6]	@ movhi
	str	r2, [r5, #16]
.L234:
	ldr	r3, .L330+32
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r1, r4
	mov	r0, #3
	mov	lr, pc
	bx	r9
	ldr	r3, .L330+4
	ldrb	r7, [fp]	@ zero_extendqisi2
	ldrh	r3, [r3, #48]
	cmp	r7, #0
	strh	r3, [r10]	@ movhi
	beq	.L305
	cmp	r7, #1
	beq	.L306
	cmp	r7, #2
	beq	.L307
	cmp	r7, #3
	beq	.L308
	cmp	r7, #4
	beq	.L309
	cmp	r7, #5
	bne	.L168
	ldr	r3, .L330+36
	mov	lr, pc
	bx	r3
	mov	r0, #3
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L330+40
	mov	lr, pc
	bx	r9
	ldr	r0, .L330+44
.L302:
	ldr	r3, .L330+48
	mov	lr, pc
	bx	r3
	ldrh	r3, [r6]
	tst	r3, #1
	ldrh	r3, [r10]
	beq	.L168
	ands	r0, r3, #1
	bne	.L168
.L300:
	ldr	r3, .L330+12
	mov	lr, pc
	bx	r3
	ldrh	r3, [r10]
	b	.L168
.L306:
	ldr	ip, .L330+28
	ldrb	r2, [ip]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L170
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L330+52
	mov	r0, #3
	strb	r7, [ip]
	ldr	r8, .L330+36
	mov	lr, pc
	bx	r9
	ldr	r7, .L330+48
	ldr	r0, .L330+56
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r8
	ldr	r0, .L330+56
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r8
	ldrh	r3, [r10]
.L170:
	ldrh	r2, [r6]
	tst	r2, #1
	beq	.L171
	ands	r7, r3, #1
	beq	.L310
.L171:
	tst	r2, #2
	beq	.L168
	ands	r0, r3, #2
	bne	.L168
	b	.L300
.L303:
	ldr	ip, .L330+28
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L330+60
	mov	r0, #3
	strb	r7, [ip]
	ldr	r8, .L330+36
	mov	lr, pc
	bx	r9
	ldr	r7, .L330+48
	ldr	r0, .L330+64
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r8
	ldr	r0, .L330+64
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r8
	ldrh	r3, [r10]
	b	.L166
.L307:
	ldr	r3, .L330+28
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L311
.L173:
	ldr	r1, [r5, #16]
	add	r2, r1, r1, lsl #4
	add	r2, r2, r2, lsl #8
	ldr	r3, .L330+68
	add	r2, r2, r2, lsl #16
	rsb	r2, r2, #0
	cmp	r3, r2, ror #1
	lsl	r3, r1, #4
	bcc	.L178
	ldrsh	r2, [r5]
	cmp	r2, #0
	moveq	r0, #1
	movne	r2, #0
	moveq	r2, #896
	moveq	ip, #83886080
	movne	ip, #83886080
	strheq	r0, [r5]	@ movhi
	ldrne	r0, .L330+72
	ldreq	r0, .L330+72
	strhne	r2, [r5]	@ movhi
	strh	r2, [ip, #26]	@ movhi
	strh	r2, [r0, #18]	@ movhi
.L178:
	add	r3, r3, r1
	add	r3, r3, r3, lsl #8
	ldr	r2, .L330+76
	add	r3, r3, r3, lsl #16
	rsb	r3, r3, #0
	cmp	r2, r3, ror #2
	bcc	.L180
	ldrsh	r0, [r5, #4]
	cmp	r0, #0
	blt	.L312
.L181:
	ldr	r3, .L330+80
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5, #4]
	sub	r3, r3, #1
	strh	r3, [r5, #4]	@ movhi
.L180:
	ldr	r3, .L330+4
	ldrh	r3, [r3, #48]
	tst	r3, #64
	beq	.L313
.L182:
	ldr	r3, .L330+4
	ldrh	r3, [r3, #48]
	tst	r3, #128
	beq	.L314
.L183:
	ldr	r3, .L330+4
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L184
	mvn	r2, #0
	ldr	r3, .L330+84
	ldrsh	r3, [r3, #6]
	cmn	r3, #4
	addlt	r3, r3, #508
	addlt	r3, r3, #3
	ldr	r1, .L330+88
	lsllt	r3, r3, #16
	asrlt	r3, r3, #16
	str	r2, [r1]
	add	r3, r3, #4
.L294:
	ldr	r1, .L330+92
	rsbs	r2, r3, #0
	and	r2, r2, r1
	and	r3, r3, r1
	rsbpl	r3, r2, #0
	ldr	r2, .L330+84
	strh	r3, [r2, #6]	@ movhi
.L186:
	ldr	r3, .L330+96
	mov	lr, pc
	bx	r3
	ldr	lr, [r5, #12]
	asr	r3, lr, #2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	rsb	r2, r3, #144
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	lsr	r0, r2, #8
	lsl	r1, r0, #7
	sub	r1, r1, r0
	lsl	r1, r1, #25
	orr	r2, r2, r1, asr #16
	lsl	r7, r2, #16
	asr	r7, r7, #16
	ldrh	r0, [r4, #50]
	lsl	r2, r7, #16
	lsr	r2, r2, #16
	add	r8, r2, #63
	bic	r0, r0, #508
	bic	r0, r0, #3
	lsl	r8, r8, #16
	str	r0, [sp, #12]
	mov	r0, r8
	ldrh	r1, [r4, #2]
	ldrh	ip, [r4, #82]
	bic	r1, r1, #508
	lsl	r8, r7, #23
	bic	r1, r1, #3
	lsr	r8, r8, #23
	orr	r8, r1, r8
	bic	ip, ip, #508
	strh	r8, [r4, #2]	@ movhi
	bic	ip, ip, #3
	ldr	r8, [sp, #8]
	orr	ip, ip, #112
	lsr	r0, r0, #16
	str	r0, [sp, #16]
	strh	ip, [r4, #82]	@ movhi
	ldr	r0, [sp, #12]
	lsl	ip, r8, #23
	lsr	ip, ip, #23
	sub	r2, r2, #98
	orr	r0, r0, ip
	ldrh	r1, [r4, #48]
	strh	r0, [r4, #50]	@ movhi
	cmp	r2, #16
	ldr	r0, .L330+84
	ldrh	r2, [r4]
	ldrb	r0, [r0]	@ zero_extendqisi2
	bic	r2, r2, #255
	bic	r1, r1, #255
	orr	r2, r2, #86
	orr	r1, r1, #20
	strh	r2, [r4]	@ movhi
	strh	r1, [r4, #48]	@ movhi
	strb	r0, [r4, #80]
	add	r8, r8, #1
	bhi	.L188
	ldr	r1, [sp, #4]
	lsl	r3, r1, #16
	lsr	r3, r3, #16
	cmp	r3, #3
	bhi	.L199
	cmp	r0, #102
	bls	.L191
	ldr	r2, [r5, #16]
	add	r3, r2, r2, lsl #1
	add	r3, r3, r3, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	add	r3, r2, r3, lsl #2
	ldr	r2, .L330+100
	cmp	r2, r3, ror #1
	add	r3, sp, #1088
	mov	r2, r1
	add	r1, r3, r1
	ldrb	r3, [r1, #-1064]	@ zero_extendqisi2
	bcc	.L192
	cmp	r3, #61
	movcs	r3, #61
	add	ip, r2, #2
	and	ip, ip, #255
	ldr	r2, .L330+104
	add	r0, r4, ip, lsl #3
	str	r2, [sp, #28]
	add	r3, r3, #1
	ldrh	r2, [r0, #2]
	and	r3, r3, #255
	bic	lr, r2, #508
	sub	r2, r3, #49
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	bic	lr, lr, #3
	orr	lr, r2, lr
	ldrb	r2, [r1, #-1060]	@ zero_extendqisi2
	strb	r3, [r1, #-1064]
	strb	r2, [r4, ip, lsl #3]
	strh	lr, [r0, #2]	@ movhi
.L192:
	cmp	r3, #62
	beq	.L191
	ldr	r0, [r5, #20]
	ldr	r3, .L330+108
	add	r0, r0, #1
	str	r0, [r5, #20]
	mov	lr, pc
	bx	r3
.L191:
	ldrb	r3, [fp, #2]	@ zero_extendqisi2
	ldr	r2, [sp, #4]
	cmp	r3, r2
	beq	.L315
.L199:
	ldr	r3, .L330+112
	ldr	r2, [sp, #16]
	cmp	r2, r3
	bls	.L202
	ldr	r3, [sp, #20]
	cmp	r3, #0
	bne	.L198
.L202:
	ldrb	r0, [fp, #2]	@ zero_extendqisi2
	ldr	r3, [sp, #4]
	cmp	r3, r0
	beq	.L316
.L207:
	mov	r3, #0
	str	r3, [sp, #20]
.L198:
	ldr	r3, [sp, #4]
	cmn	r3, #1
	beq	.L317
.L209:
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L318
	ldr	r3, [sp, #4]
	cmp	r3, #1
	beq	.L319
	ldr	r3, [sp, #4]
	cmp	r3, #2
	beq	.L320
	ldr	r3, [sp, #4]
	cmp	r3, #3
	beq	.L321
.L214:
	ldr	lr, [r5, #12]
	ldr	r2, [sp, #4]
	asr	r3, lr, #2
	lsl	r3, r3, #16
	cmp	r2, #4
	lsr	r3, r3, #16
	beq	.L235
.L210:
	ldr	r2, .L330+84
	ldrsh	r2, [r2, #6]
	add	r1, r2, #31
	cmp	r2, #0
	movlt	r2, r1
	mov	r1, #67108864
	asr	r2, r2, #5
	rsbs	r0, r2, #0
	and	r0, r0, #15
	and	r2, r2, #15
	rsbpl	r2, r0, #0
	lsl	r2, r2, #1
	add	r0, sp, #32
	ldrh	r2, [r0, r2]
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	add	r0, r2, #128
	lsl	r0, r0, #23
	ldr	r7, .L330+116
	lsr	r0, r0, #23
	lsl	r2, r2, #1
	lsl	r0, r0, #1
	ldrsh	ip, [r7, r2]
	ldrsh	r0, [r7, r0]
	asr	r2, lr, #3
	asr	r0, r0, #4
	asr	ip, ip, #4
	lsl	r2, r2, #16
	strh	r0, [r4, #38]	@ movhi
	strh	r0, [r4, #62]	@ movhi
	lsr	r2, r2, #16
	rsb	r0, ip, #0
	strh	ip, [r4, #54]	@ movhi
	strh	r0, [r4, #46]	@ movhi
	strh	r2, [r1, #24]	@ movhi
	strh	r3, [r1, #20]	@ movhi
	ldrh	r2, [r6]
	tst	r2, #4
	ldrh	r3, [r10]
	beq	.L216
	tst	r3, #4
	beq	.L322
.L216:
	tst	r2, #8
	beq	.L217
	tst	r3, #8
	beq	.L323
.L217:
	tst	r2, #1
	beq	.L221
	tst	r3, #1
	beq	.L324
.L221:
	tst	r2, #2
	beq	.L241
	tst	r3, #2
	beq	.L325
.L241:
	str	r8, [sp, #8]
	b	.L168
.L304:
	ldr	r3, .L330+120
	mov	lr, pc
	bx	r3
	ldrb	r3, [fp]	@ zero_extendqisi2
	ldr	r2, .L330+28
	mov	r0, r7
	strb	r3, [r2]
	ldr	r3, .L330+308
	mov	lr, pc
	bx	r3
	mov	r3, #2
	ldrh	r2, [r6]
	strb	r3, [fp]
	ldrh	r3, [r10]
	b	.L167
.L308:
	ldr	r1, .L330+28
	ldrb	r2, [r1]	@ zero_extendqisi2
	cmp	r2, #3
	beq	.L223
	mov	r8, #67108864
	ldr	r2, .L330+124
	strb	r7, [r1]
	mov	r3, #1280
	mov	r0, r7
	strh	r2, [r8, #10]	@ movhi
	ldr	r1, .L330+128
	ldr	r2, .L330+132
	mov	lr, pc
	bx	r9
	mov	r3, #1024
	ldr	r2, .L330+136
	mov	r0, r7
	ldr	r1, .L330+140
	mov	lr, pc
	bx	r9
	mvn	r3, #15
	mov	r2, #0
	strh	r3, [r8, #20]	@ movhi
	strh	r3, [r8, #22]	@ movhi
	strh	r2, [r5]	@ movhi
	ldrh	r3, [r10]
.L223:
	ldrh	r2, [r6]
	tst	r2, #1
	beq	.L224
	tst	r3, #1
	bne	.L224
	ldrsh	r0, [r5]
	cmp	r0, #0
	beq	.L326
	cmp	r0, #1
	beq	.L226
.L298:
	ldrh	r2, [r6]
	ldrh	r3, [r10]
.L224:
	tst	r2, #8
	beq	.L227
	tst	r3, #8
	bne	.L227
	ldrsh	r0, [r5]
	cmp	r0, #0
	beq	.L327
	cmp	r0, #1
	beq	.L229
.L299:
	ldrh	r2, [r6]
	ldrh	r3, [r10]
.L227:
	tst	r2, #64
	beq	.L230
	ands	r1, r3, #64
	bne	.L230
	ldrsh	r0, [r5]
	cmp	r0, #1
	strheq	r1, [r5]	@ movhi
.L230:
	tst	r2, #128
	beq	.L168
	ldrh	r1, [r5]
	and	r2, r3, #128
	orrs	r2, r1, r2
	moveq	r2, #1
	strheq	r2, [r5]	@ movhi
	b	.L168
.L188:
	cmn	r7, #63
	movge	r0, #0
	movlt	r0, #1
	ldr	r1, [sp, #20]
	cmp	r1, #1
	moveq	r1, #0
	andne	r1, r0, #1
	cmp	r1, #0
	beq	.L237
	ldr	r0, .L330+84
	ldrsh	r0, [r0, #2]
	cmp	r0, #0
	ble	.L195
	ldr	r2, [sp, #4]
	cmp	r2, #3
	bgt	.L196
	ldr	r3, .L330+112
	ldr	r1, [sp, #16]
	add	r0, r2, #1
	lsl	r2, r0, #16
	cmp	r1, r3
	asr	r3, r2, #16
	str	r3, [sp, #4]
	movhi	r3, #1
	strhi	r3, [sp, #20]
	bhi	.L198
	ldrb	r0, [fp, #2]	@ zero_extendqisi2
	ldr	r3, [sp, #4]
	cmp	r0, r3
	bne	.L207
.L236:
	ldr	r3, .L330+316
	mov	r1, #1
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r3, [sp, #20]
	ldr	r3, [sp, #4]
	cmn	r3, #1
	bne	.L209
.L317:
	ldr	lr, [r5, #12]
	asr	r3, lr, #2
	lsl	r3, r3, #16
	ldrh	r2, [r4]
	lsr	r3, r3, #16
.L201:
	bic	r2, r2, #768
	orr	r2, r2, #512
	strh	r2, [r4]	@ movhi
	mvn	r2, #0
	str	r2, [sp, #4]
	b	.L210
.L184:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L186
	mov	r2, #1
	ldr	r3, .L330+84
	ldrsh	r3, [r3, #6]
	cmp	r3, #3
	addle	r3, r3, #508
	addle	r3, r3, #3
	lslle	r3, r3, #16
	ldr	r1, .L330+88
	asrle	r3, r3, #16
	str	r2, [r1]
	sub	r3, r3, #4
	b	.L294
.L314:
	ldr	r3, .L330+144
	mov	lr, pc
	bx	r3
	b	.L183
.L313:
	ldr	r3, .L330+144
	mov	lr, pc
	bx	r3
	b	.L182
.L311:
	mov	r8, #0
	ldr	ip, .L330+28
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L330+148
	strb	r7, [ip]
	strh	r8, [r5]	@ movhi
	mov	r7, #67108864
	mov	lr, pc
	bx	r9
	mov	r2, #6400
	mov	r3, #2448
	mov	r0, #3
	strh	r2, [r7, #8]	@ movhi
	ldr	r1, .L330+152
	mov	r2, #100663296
	mov	lr, pc
	bx	r9
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L330+156
	ldr	r1, .L330+160
	mov	lr, pc
	bx	r9
	ldr	r2, .L330+164
	mov	r3, #352
	mov	r0, #3
	strh	r8, [r7, #16]	@ movhi
	ldr	r1, .L330+168
	strh	r2, [r7, #10]	@ movhi
	ldr	r2, .L330+132
	mov	lr, pc
	bx	r9
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L330+136
	ldr	r1, .L330+172
	mov	lr, pc
	bx	r9
	mvn	r2, #111
	ldr	r1, .L330+176
	strh	r8, [r7, #20]	@ movhi
	mov	r3, #288
	strh	r2, [r7, #22]	@ movhi
	mov	r0, #3
	ldr	r2, .L330+180
	strh	r1, [r7, #12]	@ movhi
	ldr	r1, .L330+184
	mov	lr, pc
	bx	r9
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L330+188
	ldr	r1, .L330+192
	mov	lr, pc
	bx	r9
	mvn	r2, #95
	ldr	r1, .L330+196
	strh	r8, [r7, #24]	@ movhi
	mov	r3, #304
	strh	r2, [r7, #26]	@ movhi
	mov	r0, #3
	ldr	r2, .L330+200
	strh	r1, [r7, #14]	@ movhi
	ldr	r1, .L330+204
	mov	lr, pc
	bx	r9
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L330+208
	ldr	r1, .L330+212
	mov	lr, pc
	bx	r9
	mov	ip, #1
	mov	r3, #16384
	mov	r0, #3
	strh	r8, [r7, #28]	@ movhi
	ldr	r2, .L330+216
	ldr	r1, .L330+220
	str	ip, [r5, #8]
	mov	lr, pc
	bx	r9
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L330+72
	ldr	r1, .L330+224
	mov	lr, pc
	bx	r9
	mov	ip, #1088
	ldr	r3, .L330+228
	ldr	r2, .L330+232
	ldrsh	r3, [r3]
	ldrsh	r2, [r2]
	asr	r3, r3, #4
	ldr	lr, .L330+236
	ldr	r0, .L330+240
	ldr	r1, .L330+244
	asr	r2, r2, #4
	strh	r3, [r4, #54]	@ movhi
	rsb	r3, r3, #0
	strh	r3, [r4, #46]	@ movhi
	strh	r2, [r4, #38]	@ movhi
	strh	r2, [r4, #62]	@ movhi
	strh	ip, [r4, #84]	@ movhi
	str	lr, [sp, #64]
	strh	r0, [r4, #4]	@ movhi
	str	r1, [sp, #144]
	add	r3, sp, #30
	b	.L177
.L175:
	add	r8, r8, #1
	add	r3, r3, #2
.L177:
	cmp	r8, #0
	strheq	r8, [sp, #32]	@ movhi
	and	r1, r8, #255
	beq	.L175
	ldrh	r2, [r3]
	cmp	r1, #15
	add	r2, r2, #32
	strh	r2, [r3, #2]	@ movhi
	bne	.L175
	ldr	r0, .L330+248
	str	r0, [sp, #80]
	sub	r0, r0, #18
	ldr	r2, .L330+252
	ldr	r1, .L330+256
	ldr	r3, .L330+260
	str	r0, [sp, #88]
	add	r0, r0, #12
	str	r0, [sp, #96]
	sub	r0, r0, #6
	strh	r2, [r4, #52]	@ movhi
	str	r1, [sp, #112]
	str	r0, [sp, #104]
	strh	r3, [r4, #20]	@ movhi
	ldrsh	r0, [r5, #4]
	strh	r3, [r4, #28]	@ movhi
	strh	r3, [r4, #36]	@ movhi
	strh	r3, [r4, #44]	@ movhi
	ldr	r3, .L330+80
	mov	lr, pc
	bx	r3
	ldr	r0, [r5, #20]
	ldr	r3, .L330+108
	mov	lr, pc
	bx	r3
	ldrb	r0, [fp, #1]	@ zero_extendqisi2
	ldr	r3, .L330+264
	mov	lr, pc
	bx	r3
	ldr	r3, [sp, #4]
	ldrb	r1, [fp, #2]	@ zero_extendqisi2
	and	r0, r3, #255
	ldr	r3, .L330+268
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r1, #7936
	add	r3, sp, #2096
	add	r3, r3, #8
	ldrh	r3, [r3]
	add	r0, sp, #2096
	bic	r3, r3, #768
	add	r0, r0, #8
	strh	r3, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	b	.L173
.L309:
	ldr	r3, .L330+36
	mov	lr, pc
	bx	r3
	mov	r0, #3
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L330+272
	mov	lr, pc
	bx	r9
	ldr	r0, .L330+276
	b	.L302
.L310:
	ldr	r3, .L330+120
	mov	lr, pc
	bx	r3
	ldrb	r3, [fp]	@ zero_extendqisi2
	ldr	r2, .L330+28
	mov	r0, r7
	strb	r3, [r2]
	ldr	r3, .L330+308
	mov	lr, pc
	bx	r3
	mov	r3, #2
	ldrh	r2, [r6]
	strb	r3, [fp]
	ldrh	r3, [r10]
	b	.L171
.L318:
	mov	r3, #16
	mov	r0, #3
	ldrh	ip, [r4]
	bic	ip, ip, #768
	ldr	r2, .L330+280
	ldr	r1, .L330+284
	strh	ip, [r4]	@ movhi
.L296:
	mov	lr, pc
	bx	r9
	ldr	lr, [r5, #12]
	asr	r3, lr, #2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	b	.L210
.L237:
	mov	r1, r0
.L195:
	ldr	r0, [sp, #20]
	cmp	r0, #2
	moveq	r1, #0
	andne	r1, r1, #1
	cmp	r1, #0
	beq	.L199
	ldr	r1, .L330+84
	ldrsh	r1, [r1, #2]
	cmp	r1, #0
	bge	.L199
	ldr	r1, [sp, #4]
	cmp	r1, #0
	bge	.L200
	ldr	r1, .L330+112
	ldr	r0, [sp, #16]
	cmp	r0, r1
	movhi	r1, #2
	movls	r1, #0
	str	r1, [sp, #20]
	b	.L201
.L316:
	cmp	r7, #97
	ble	.L236
	ldr	r3, [sp, #4]
	ldrb	r0, [fp, #2]	@ zero_extendqisi2
	sub	r2, r3, r0
	rsbs	r3, r2, #0
	adc	r3, r3, r2
	cmp	r7, #116
	movle	r3, #0
	cmp	r3, #0
	beq	.L239
	ldr	r3, .L330+316
	mov	r1, #0
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r3, [sp, #20]
	b	.L198
.L324:
	ldr	r3, .L330+12
	mov	r0, #4
	mov	lr, pc
	bx	r3
	ldrh	r2, [r6]
	ldrh	r3, [r10]
	b	.L221
.L325:
	ldr	r3, .L330+12
	mov	r0, #5
	str	r8, [sp, #8]
	mov	lr, pc
	bx	r3
	ldrh	r3, [r10]
	b	.L168
.L322:
	mov	r1, #3
	mov	r3, #10
	ldr	r2, .L330+288
	mov	r0, r1
	mov	lr, pc
	bx	r9
	ldrh	r2, [r6]
	ldrh	r3, [r10]
	b	.L216
.L196:
	ldr	r2, .L330+112
	ldr	r1, [sp, #16]
	cmp	r1, r2
	bhi	.L328
	ldrb	r7, [fp, #2]	@ zero_extendqisi2
	cmp	r7, #4
	beq	.L329
	mov	r3, #4
	str	r3, [sp, #4]
	mov	r3, #0
	str	r3, [sp, #20]
	b	.L214
.L323:
	ldrb	r3, [r5, #8]	@ zero_extendqisi2
	cmp	r3, #0
	sub	r3, r3, #1
	and	r3, r3, #255
	addne	r2, r4, r3, lsl #3
	beq	.L220
.L219:
	ldrh	r3, [r2]
	bic	r3, r3, #768
	orr	r3, r3, #512
	cmp	r2, r4
	strh	r3, [r2], #-8	@ movhi
	bne	.L219
.L220:
	ldr	r3, .L330+12
	mov	r0, #3
	mov	lr, pc
	bx	r3
	ldrh	r2, [r6]
	ldrh	r3, [r10]
	b	.L217
.L312:
	mov	r0, #5
	ldr	r3, .L330+12
	mov	lr, pc
	bx	r3
	ldrsh	r0, [r5, #4]
	b	.L181
.L200:
	ldr	r2, [sp, #4]
	ldr	r3, .L330+112
	ldr	r1, [sp, #16]
	sub	r0, r2, #1
	lsl	r2, r0, #16
	cmp	r1, r3
	asr	r3, r2, #16
	str	r3, [sp, #4]
	movhi	r3, #2
	strhi	r3, [sp, #20]
	bhi	.L198
	b	.L202
.L319:
	mov	r3, #16
	ldr	r2, .L330+280
	ldr	r1, .L330+292
.L297:
	mov	r0, #3
	b	.L296
.L315:
	ldr	r2, [r5, #16]
	add	r3, r2, r2, lsl #1
	add	r3, r3, r3, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	add	r3, r2, r3, lsl #2
	ldr	r2, .L330+100
	cmp	r2, r3, ror #1
	bcc	.L199
	mov	r1, #2
	ldr	r0, [sp, #4]
	ldr	r3, .L330+316
	mov	lr, pc
	bx	r3
	b	.L199
.L328:
	mov	r2, #1
	str	r2, [sp, #20]
.L235:
	mov	r2, #4
	str	r2, [sp, #4]
	ldrh	r2, [r4]
	bic	r2, r2, #768
	orr	r2, r2, #512
	strh	r2, [r4]	@ movhi
	b	.L210
.L320:
	mov	r3, #16
	ldr	r2, .L330+280
	ldr	r1, .L330+296
	b	.L297
.L321:
	ldrh	ip, [r4]
	bic	ip, ip, #768
	mov	r3, #16
	ldr	r2, .L330+280
	ldr	r1, .L330+300
	ldr	r0, [sp, #4]
	strh	ip, [r4]	@ movhi
	b	.L296
.L326:
	ldrb	r3, [fp]	@ zero_extendqisi2
	ldr	r2, .L330+28
	strb	r3, [r2]
	ldr	r3, .L330+308
	mov	lr, pc
	bx	r3
	mov	r3, #2
	ldrsh	r0, [r5]
	cmp	r0, #1
	strb	r3, [fp]
	bne	.L298
.L226:
	mov	r0, #0
	ldr	r3, .L330+12
	mov	lr, pc
	bx	r3
	b	.L298
.L331:
	.align	2
.L330:
	.word	oldButtons
	.word	67109120
	.word	buttons
	.word	change_state
	.word	DMANow
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	oldSTATE
	.word	waitForVBlank
	.word	flipPage
	.word	losePal
	.word	loseBitmap
	.word	drawFullscreenImage4
	.word	InstructionsPal
	.word	InstructionsBitmap
	.word	splashscreenPal
	.word	splashscreenBitmap
	.word	143165576
	.word	83886592
	.word	71582788
	.word	set_counter
	.word	player_ship
	.word	mountain_hoff
	.word	511
	.word	move_player
	.word	429496729
	.word	-1970240362
	.word	set_score
	.word	302
	.word	sin_lut
	.word	initialize_GAME
	.word	5636
	.word	PauseMenuTiles
	.word	100679680
	.word	100708352
	.word	PauseMenuMap
	.word	activate_thrusters
	.word	ship_uiPal
	.word	ship_uiTiles
	.word	100714496
	.word	ship_uiMap
	.word	22021
	.word	cratersTiles
	.word	cratersMap
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
	.word	100728832
	.word	ship_000Tiles
	.word	ship_000Pal
	.word	sin_lut+448
	.word	sin_lut+704
	.word	-1071103918
	.word	2050
	.word	1109918042
	.word	-1043382122
	.word	5144
	.word	-2140667874
	.word	10376
	.word	set_level
	.word	set_compass_target
	.word	winPal
	.word	winBitmap
	.word	100731072
	.word	100732224
	.word	100726784
	.word	100729152
	.word	100731200
	.word	100730176
	.word	oldSTATE
	.word	switch_graphics_mode
	.word	change_state
	.word	set_compass
.L327:
	ldrb	r3, [fp]	@ zero_extendqisi2
	ldr	r2, .L330+304
	strb	r3, [r2]
	ldr	r3, .L330+308
	mov	lr, pc
	bx	r3
	mov	r3, #2
	ldrsh	r0, [r5]
	cmp	r0, #1
	strb	r3, [fp]
	bne	.L299
.L229:
	mov	r0, #0
	ldr	r3, .L330+312
	mov	lr, pc
	bx	r3
	b	.L299
.L329:
	ldr	r3, .L330+316
	mov	r1, #1
	mov	r0, r7
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r7, [sp, #4]
	str	r3, [sp, #20]
	b	.L214
.L239:
	str	r3, [sp, #20]
	b	.L198
	.size	main, .-main
	.comm	player_ship,8,4
	.global	old_world_offset
	.global	world_offset
	.global	game_target_station
	.global	game_score
	.global	game_level
	.global	game_counter
	.global	sprite_count
	.global	video_initialized
	.global	temp_pal
	.comm	mountain_hoff,4,4
	.comm	oldSTATE,1,1
	.global	STATE
	.global	heading
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
	.type	game_level, %object
	.size	game_level, 1
game_level:
	.byte	1
	.type	game_target_station, %object
	.size	game_target_station, 1
game_target_station:
	.byte	1
	.space	1
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
	.type	video_initialized, %object
	.size	video_initialized, 1
video_initialized:
	.space	1
	.space	1
	.type	game_counter, %object
	.size	game_counter, 2
game_counter:
	.space	2
	.space	2
	.type	sprite_count, %object
	.size	sprite_count, 4
sprite_count:
	.space	4
	.type	world_offset, %object
	.size	world_offset, 4
world_offset:
	.space	4
	.type	frameCount, %object
	.size	frameCount, 4
frameCount:
	.space	4
	.type	game_score, %object
	.size	game_score, 4
game_score:
	.space	4
	.type	old_world_offset, %object
	.size	old_world_offset, 4
old_world_offset:
	.space	4
	.type	heading, %object
	.size	heading, 2
heading:
	.space	2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
