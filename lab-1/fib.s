	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, lr}

	@ R4 = R0 - 0 (update flags)
	subs R4, R0, #0

	@ if(R0 <= 0) goto .L3 (which returns 0)
	ble .L3

	@ If(R4 == 1) goto .L4 (which returns 1)
	cmp R4, #1
	beq .L4

	@ R0 = R4 - 1
	sub R0, R4, #1

	@ Recursive call to fibonacci with R4 - 1 as parameter
	bl fibonacci

	@ R5 = R0
	mov R5, R0

	@ R0 = R4 - 2
	subs R0, R4, #2

	@ Recursive call to fibonacci with R4 - 2 as parameter
	bl fibonacci

	@ R0 = R5 + R0 (update flags)
	adds R0, R5, R0

	pop {r3, r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION
.L3:
	mov r0, #0			@ R0 = 0
	pop {r3, r4, r5, pc}		@ EPILOG

.L4:
	mov r0, #1			@ R0 = 1
	pop {r3, r4, r5, pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
