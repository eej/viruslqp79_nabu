
    IFDEF  CPM
        ; CP/M .com entry point
        org $0100
        di
    ELSE
        ; Homebrew .nabu entry point
        ORG $140D
        nop
        nop
        nop
    ENDIF

entry:
    jp relocator

incStart:
    incbin "nc-bios.bin"
    incbin "lqp79.rom"
incEnd:

relocator:
        ld hl, incStart ; source
        ld de, $0000 ; target
        ld bc, incEnd - incStart ; length
        ldir ; copy

        jp $0000