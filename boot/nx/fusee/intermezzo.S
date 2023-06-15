//
// Payload launcher stub.
//

.globl _start

.section ".text"
_start:

    // First, we'll need to move ourselves _out_ of the target area.
    // We'll copy down into the IRAM.
    ldr r0, =INTERMEZZO_RELOCATED_ADDRESS
    ldr r1, =post_relocation
    ldr r2, =intermezzo_end
    sub r2, r2, r1
    bl  copy

    // Jump to the start of RAM, which should now contain the post-relocation code.
    ldr r0, =INTERMEZZO_RELOCATED_ADDRESS
    bx  r0


.align 4
post_relocation:

    // Next, we'll copy our payload down to the appropriate relocaiton address.
    ldr r0, =RELOCATION_TARGET
    ldr r1, =PAYLOAD_START_ADDR
    ldr r2, =BEFORE_SPRAY_LENGTH
    bl  copy

    ldr r0, =RELOCATION_TARGET
    ldr r1, =BEFORE_SPRAY_LENGTH
    add r0, r0, r1
    ldr r1, =STACK_SPRAY_END
    ldr r2, =AFTER_SPRAY_LENGTH
    bl  copy

    // Finally, jump into the relocated target.
    ldr r0, =ENTRY_POINT_ADDRESS
    bx r0


//
// Simple block copy.
//   r0 = destination address
//   r1 = source address
//   r2 = length in bytes
// Destroys r0-r3.
//
copy:

    // Copy the word...
    ldr r3, [r1], #4
    str r3, [r0], #4

    // And continue while we have words left to copy.
    subs r2, r2, #4
    bne copy

    // Once we're done, return.
    bx lr

