;
; Music Data
; ==========
;
; Each segment of music is broken down into tracks for individual instruments.
;
; Square 2:
;   $00: End of segment
;   $01-$7D: Note On
;   $7E: Rest
;   $80-$FE: first nybble is the instrument, second nybble is the note length
;            as determined by the note length lookup table. The next byte is
;            expected to be a Note On.
;   $FF: activate bend if used after a Note On
;
; Square 1 is the same as Square 2, except for the following:
;   $00: Activate a ramp effect
;
; Triangle is the same as Square 2, except for the following:
;   $00: Mute output (triangle channel is constant volume otherwise)
;   $80-$FF: second nybble is the note length from the note length lookup table
;
; Noise/DPCM:
;   $00: Restart (used for looping percussion within a segment)
;   $01: Rest
;   $02-$7F: Various note-on values, low bit is ignored
;   $02: Closed Hi-Hat
;   $04: Kick
;   $06: Open Hi-Hat
;   $08: Quiet Hi-Hat
;   $0A: Crash Cymbal
;   $0C: Brushed Snare
;   $0E: Muted Crash
;   $10: Snare
;   $12: Deep Kick
;   $14: High Static
;   $16: Low Static
;   $18: Ride
;   $1A: Closed Hi-Hat
;   $1C: Medium Static
;   $1E: Obnoxious Crash
;   $80-$FF: second nybble is the note length from the note length lookup table
;
; DPCM is the same as Noise, except for the following:
;
; The SMB3 disassembly is a good reference, since the format is the same:
; http://sonicepoch.com/sm3mix/disassembly.html#TRACK
;
MusicData:

;
; Ending music
; Segments 3 and 4 share a noise track (set in segment 4)
;
.include "src/music/segments/ending/ending-1.asm"
.include "src/music/segments/ending/ending-3.asm"
.include "src/music/segments/ending/ending-4.asm"
.include "src/music/segments/ending/ending-2.asm"
.include "src/music/segments/ending/ending-5.asm"
.include "src/music/segments/ending/ending-6.asm"

;
; Starman music
;
.include "src/music/segments/star/star.asm"

;
; Underground music
; (including prototype version)
;
IFNDEF PROTOTYPE_MUSIC
	.include "src/music/segments/underground/underground.asm"
ENDIF
IFDEF PROTOTYPE_MUSIC
	.include "src/music/segments/underground/underground-prototype.asm"
ENDIF

;
; Subspace music
; Segments 1 and 2 share the same noise track,
; as do segments 3 and 4 (defined in 2 and 4)
;
.include "src/music/segments/subspace/subspace-1.asm"
.include "src/music/segments/subspace/subspace-2.asm"
.include "src/music/segments/subspace/subspace-3.asm"
.include "src/music/segments/subspace/subspace-4.asm"

;
; Title screen music
;
.include "src/music/segments/title/title-1.asm"
.include "src/music/segments/title/title-2.asm"
.include "src/music/segments/title/title-3.asm"
.include "src/music/segments/title/title-4.asm"

;
; Character Select screen music (1 through 5)
; 3 and 4 share the same triangle and noise channel
;
.include "src/music/segments/character-select/character-select-1.asm"
.include "src/music/segments/character-select/character-select-2-square2.asm"
.include "src/music/segments/character-select/character-select-3-square2.asm"
.include "src/music/segments/character-select/character-select-4-square2.asm"
.include "src/music/segments/character-select/character-select-2-square1.asm"
.include "src/music/segments/character-select/character-select-3-square1.asm"
.include "src/music/segments/character-select/character-select-4-square1.asm"
.include "src/music/segments/character-select/character-select-2-triangle.asm"
.include "src/music/segments/character-select/character-select-3-4-triangle.asm"
.include "src/music/segments/character-select/character-select-2-noise.asm"
.include "src/music/segments/character-select/character-select-3-4-noise.asm"





















MusicDataCharacterSelect5:
MusicDataCharacterSelect5_Square2:
	.db $C8
	.db $50
	.db $7E
	.db $50
	.db $C6
	.db $7E
	.db $C2
	.db $50
	.db $C6
	.db $7E
	.db $C8
	.db $4C
	.db $C2
	.db $7E
	.db $C8
	.db $4C
	.db $50
	.db $C4
	.db $4C
	.db $7E
	.db $48
	.db $7E
	.db $C2
	.db $48
	.db $C6
	.db $46
	.db $7E
	.db $C8
	.db $48
	.db $C2
	.db $7E
	.db $C8
	.db $42
	.db $46
	.db $48
	.db $C8
	.db $4C
	.db $7E
	.db $4C
	.db $C6
	.db $7E
	.db $C2
	.db $4C
	.db $C6
	.db $7E
	.db $C8
	.db $48
	.db $C2
	.db $7E
	.db $C8
	.db $46
	.db $C4
	.db $42
	.db $7E
	.db $00

MusicDataCharacterSelect6:
MusicDataCharacterSelect6_Square2:
	.db $C8
	.db $7E
	.db $46
	.db $48
	.db $4A
	.db $C8
	.db $4C
	.db $7E
	.db $C6
	.db $7E
	.db $C8
	.db $3E
	.db $C2
	.db $7E
	.db $00

MusicDataCharacterSelect5_Square1:
	.db $C8
	.db $40
	.db $7E
	.db $40
	.db $C6
	.db $7E
	.db $C2
	.db $40
	.db $C6
	.db $7E
	.db $C8
	.db $3C
	.db $C2
	.db $7E
	.db $C8
	.db $3C
	.db $40
	.db $C4
	.db $38
	.db $7E
	.db $38
	.db $7E
	.db $C2
	.db $38
	.db $C6
	.db $34
	.db $7E
	.db $C8
	.db $38
	.db $C2
	.db $7E
	.db $C8
	.db $30
	.db $34
	.db $38
	.db $C8
	.db $3C
	.db $7E
	.db $3C
	.db $C6
	.db $7E
	.db $C2
	.db $3C
	.db $C6
	.db $7E
	.db $C8
	.db $38
	.db $C2
	.db $7E
	.db $C8
	.db $34
	.db $C4
	.db $30
	.db $7E

MusicDataCharacterSelect6_Square1:
	.db $C8
	.db $7E
	.db $34
	.db $38
	.db $3A
	.db $C8
	.db $3C
	.db $7E
	.db $C6
	.db $7E
	.db $C8
	.db $2E
	.db $C2
	.db $7E

MusicDataCharacterSelect5_Triangle:
	.db $88
	.db $38
	.db $7E
	.db $3C
	.db $7E
	.db $3E
	.db $7E
	.db $40
	.db $46
	.db $42
	.db $7E
	.db $46
	.db $7E
	.db $48
	.db $7E
	.db $46
	.db $42
	.db $34
	.db $7E
	.db $38
	.db $7E
	.db $3A
	.db $7E
	.db $3C
	.db $42

MusicDataCharacterSelect6_Triangle:
	.db $88
	.db $7E
	.db $3E
	.db $42
	.db $44
	.db $46
	.db $7E
	.db $8A
	.db $7E

MusicDataCharacterSelect5_Noise:
	.db $88
	.db $02
	.db $04
	.db $00

MusicDataCharacterSelect6_Noise:
	.db $88
	.db $02
	.db $04
	.db $04
	.db $04
	.db $02
	.db $02
	.db $7E
	.db $06

MusicDataCharacterSelect7:
MusicDataCharacterSelect7_Square2:
	.db $96
	.db $50
	.db $92
	.db $4E
	.db $96
	.db $50
	.db $92
	.db $5E
	.db $96
	.db $58
	.db $92
	.db $50
	.db $96
	.db $68
	.db $92
	.db $5E
	.db $96
	.db $64
	.db $92
	.db $5E
	.db $96
	.db $5A
	.db $92
	.db $5E
	.db $96
	.db $58
	.db $92
	.db $52
	.db $96
	.db $50
	.db $92
	.db $4C
	.db $96
	.db $48
	.db $92
	.db $46
	.db $96
	.db $48
	.db $92
	.db $4C
	.db $96
	.db $50
	.db $92
	.db $4E
	.db $96
	.db $50
	.db $92
	.db $5A
	.db $96
	.db $58
	.db $92
	.db $50
	.db $96
	.db $4C
	.db $92
	.db $4E
	.db $96
	.db $5A
	.db $92
	.db $50
	.db $96
	.db $56
	.db $92
	.db $54
	.db $96
	.db $52
	.db $92
	.db $50
	.db $96
	.db $52
	.db $92
	.db $5A
	.db $96
	.db $68
	.db $92
	.db $4C
	.db $96
	.db $5A
	.db $92
	.db $58
	.db $96
	.db $56
	.db $92
	.db $68
	.db $96
	.db $56
	.db $92
	.db $54
	.db $96
	.db $52
	.db $92
	.db $64
	.db $96
	.db $5A
	.db $92
	.db $5C
	.db $00
MusicDataCharacterSelect7_Square1:
	.db $C8
	.db $50
	.db $7E
	.db $50
	.db $C6
	.db $7E
	.db $C2
	.db $50
	.db $C6
	.db $7E
	.db $C8
	.db $4C
	.db $C2
	.db $7E
	.db $C8
	.db $4C
	.db $50
	.db $C4
	.db $4C
	.db $7E
	.db $48
	.db $7E
	.db $C2
	.db $48
	.db $C6
	.db $46
	.db $C6
	.db $7E
	.db $C8
	.db $48
	.db $C2
	.db $7E
	.db $C8
	.db $42
	.db $46
	.db $48
	.db $4C
	.db $7E
	.db $4C
	.db $C6
	.db $7E
	.db $C2
	.db $4C
	.db $C6
	.db $7E
	.db $C8
	.db $48
	.db $C2
	.db $7E
	.db $C8
	.db $46
	.db $C4
	.db $42
	.db $7E
MusicDataCharacterSelect7_Triangle:
	.db $88
	.db $38
	.db $7E
	.db $3C
	.db $7E
	.db $3E
	.db $7E
	.db $40
	.db $46
	.db $42
	.db $7E
	.db $46
	.db $7E
	.db $48
	.db $7E
	.db $46
	.db $42
	.db $34
	.db $7E
	.db $38
	.db $7E
	.db $3A
	.db $7E
	.db $3C
	.db $42
MusicDataCharacterSelect7_Noise:
	.db $88
	.db $02
	.db $04
	.db $00

MusicDataCharacterSelect8:
MusicDataCharacterSelect8_Square2:
	.db $96
	.db $5E
	.db $92
	.db $5C
	.db $96
	.db $5E
	.db $92
	.db $5A
	.db $96
	.db $56
	.db $92
	.db $52
	.db $96
	.db $42
	.db $92
	.db $46
	.db $96
	.db $56
	.db $92
	.db $52
	.db $96
	.db $46
	.db $92
	.db $42
	.db $96
	.db $52
	.db $92
	.db $46
	.db $96
	.db $42
	.db $92
	.db $3E
	.db $00
MusicDataCharacterSelect8_Square1:
	.db $C8
	.db $7E
	.db $46
	.db $48
	.db $4A
	.db $C8
	.db $4C
	.db $7E
	.db $C6
	.db $7E
	.db $C8
	.db $3E
	.db $C2
	.db $7E
MusicDataCharacterSelect8_Triangle:
	.db $88
	.db $7E
	.db $3E
	.db $42
	.db $44
	.db $46
	.db $7E
	.db $8A
	.db $7E
MusicDataCharacterSelect8_Noise:
	.db $88
	.db $02
	.db $04
	.db $04
	.db $04
	.db $02
	.db $02
	.db $7E
	.db $06

MusicDataOverworld1:
MusicDataOverworld1_Square2:
	.db $A2
	.db $7E
	.db $7E
	.db $56
	.db $54
	.db $7E
	.db $52
	.db $4C
	.db $7E
	.db $46
	.db $42
	.db $7E
	.db $40
	.db $A4
	.db $3E
	.db $7E
	.db $56
	.db $7E
	.db $A8
	.db $3E
	.db $7E
	.db $00
MusicDataOverworld1_Square1:
	.db $A2
	.db $7E
	.db $7E
	.db $46
	.db $44
	.db $7E
	.db $42
	.db $3A
	.db $7E
	.db $34
	.db $30
	.db $7E
	.db $2E
	.db $A4
	.db $2E
	.db $7E
	.db $46
	.db $7E
	.db $A8
	.db $3A
	.db $7E
MusicDataOverworld1_Triangle:
	.db $82
	.db $7E
	.db $7E
	.db $4C
	.db $4A
	.db $7E
	.db $48
	.db $46
	.db $7E
	.db $3E
	.db $3A
	.db $7E
	.db $38
	.db $88
	.db $34
	.db $4C
	.db $34
	.db $3E
MusicDataOverworld1_Noise:
	.db $8A
	.db $01
	.db $01
	.db $88
	.db $02
	.db $82
	.db $02
	.db $02
	.db $02
	.db $02
	.db $01
	.db $02
	.db $02
	.db $02
	.db $02

MusicDataOverworld2:
MusicDataOverworld2_Square2:
	.db $82
	.db $56
	.db $7E
	.db $48
	.db $50
	.db $7E
	.db $88
	.db $56
	.db $82
	.db $48
	.db $50
	.db $7E
	.db $56
	.db $46
	.db $4E
	.db $56
	.db $5E
	.db $7E
	.db $8A
	.db $5A
	.db $82
	.db $7E
	.db $56
	.db $7E
	.db $44
	.db $4C
	.db $7E
	.db $88
	.db $56
	.db $82
	.db $44
	.db $4C
	.db $7E
	.db $56
	.db $4A
	.db $50
	.db $56
	.db $5E
	.db $7E
	.db $8A
	.db $5A
	.db $82
	.db $5E
	.db $60
	.db $7E
	.db $5E
	.db $60
	.db $7E
	.db $88
	.db $5A
	.db $82
	.db $60
	.db $5E
	.db $7E
	.db $5A
	.db $56
	.db $7E
	.db $54
	.db $56
	.db $7E
	.db $88
	.db $50
	.db $82
	.db $4A
	.db $4C
	.db $7E
	.db $50
	.db $52
	.db $7E
	.db $50
	.db $52
	.db $7E
	.db $88
	.db $46
	.db $82
	.db $50
	.db $4C
	.db $7E
	.db $8A
	.db $48
	.db $7E
	.db $82
	.db $7E
	.db $00
MusicDataOverworld2_Square1:
	.db $82
	.db $48
	.db $7E
	.db $38
	.db $3E
	.db $7E
	.db $88
	.db $48
	.db $82
	.db $38
	.db $3E
	.db $7E
	.db $48
	.db $36
	.db $3E
	.db $46
	.db $4E
	.db $7E
	.db $8A
	.db $46
	.db $82
	.db $7E
	.db $44
	.db $7E
	.db $34
	.db $3E
	.db $7E
	.db $88
	.db $44
	.db $82
	.db $34
	.db $3E
	.db $7E
	.db $44
	.db $38
	.db $42
	.db $4A
	.db $50
	.db $7E
	.db $8A
	.db $4A
	.db $82
	.db $50
	.db $5A
	.db $7E
	.db $56
	.db $5A
	.db $7E
	.db $88
	.db $52
	.db $82
	.db $5A
	.db $56
	.db $7E
	.db $54
	.db $50
	.db $7E
	.db $4E
	.db $50
	.db $7E
	.db $88
	.db $48
	.db $82
	.db $42
	.db $46
	.db $7E
	.db $4A
	.db $4C
	.db $7E
	.db $48
	.db $4C
	.db $7E
	.db $88
	.db $3E
	.db $82
	.db $48
	.db $46
	.db $7E
	.db $8A
	.db $3E
	.db $8A
	.db $7E
	.db $82
	.db $7E
MusicDataOverworld2_Triangle:
	.db $88
	.db $30
	.db $3E
	.db $30
	.db $3E
	.db $2E
	.db $3E
	.db $2E
	.db $3E
	.db $2C
	.db $3E
	.db $2C
	.db $3E
	.db $2A
	.db $3E
	.db $2A
	.db $3E
	.db $22
	.db $3A
	.db $24
	.db $3C
	.db $26
	.db $3E
	.db $2A
	.db $42
	.db $34
	.db $3A
	.db $26
	.db $34
	.db $30
	.db $26
	.db $30
	.db $7E
MusicDataOverworld2_Noise:
	.db $88
	.db $01
	.db $02
	.db $01
	.db $02
	.db $88
	.db $01
	.db $02
	.db $82
	.db $02
	.db $02
	.db $02
	.db $02
	.db $01
	.db $02
	.db $00

MusicDataOverworld3:
MusicDataOverworld3_Square2:
	.db $92
	.db $7E
	.db $7E
	.db $98
	.db $50
	.db $92
	.db $7E
	.db $56
	.db $7E
	.db $7E
	.db $5A
	.db $7E
	.db $9A
	.db $60
	.db $92
	.db $7E
	.db $5A
	.db $7E
	.db $56
	.db $50
	.db $7E
	.db $48
	.db $4C
	.db $7E
	.db $50
	.db $4C
	.db $7E
	.db $50
	.db $4C
	.db $7E
	.db $42
	.db $7E
	.db $7E
	.db $98
	.db $4C
	.db $90
	.db $42
	.db $4C
	.db $42
	.db $4C
	.db $42
	.db $4C
	.db $42
	.db $4C
	.db $42
	.db $4C
	.db $42
	.db $4C
	.db $92
	.db $7E
	.db $98
	.db $4C
	.db $92
	.db $50
	.db $4C
	.db $7E
	.db $50
	.db $4C
	.db $7E
	.db $50
	.db $7E
	.db $7E
	.db $98
	.db $5A
	.db $92
	.db $56
	.db $5A
	.db $7E
	.db $56
	.db $00

MusicDataOverworld4:
MusicDataOverworld4_Square2:
	.db $92
	.db $50
	.db $7E
	.db $4C
	.db $48
	.db $7E
	.db $98
	.db $50
	.db $90
	.db $3E
	.db $50
	.db $3E
	.db $50
	.db $3E
	.db $50
	.db $3E
	.db $50
	.db $3E
	.db $50
	.db $3E
	.db $50
	.db $92
	.db $7E
	.db $7E
	.db $C2
	.db $7E
	.db $7E
	.db $56
	.db $7E
	.db $4E
	.db $7E
	.db $46
	.db $7E
	.db $42
	.db $7E
	.db $3E
	.db $7E
	.db $00

MusicDataOverworld3_Noise:
MusicDataOverworld4_Noise:
	.db $88
	.db $06
	.db $82
	.db $02
	.db $01
	.db $02
	.db $00

MusicDataOverworld3_Square1:
	.db $92
	.db $7E
	.db $7E
	.db $98
	.db $3E
	.db $92
	.db $7E
	.db $48
	.db $7E
	.db $7E
	.db $50
	.db $7E
	.db $9A
	.db $56
	.db $92
	.db $7E
	.db $50
	.db $7E
	.db $48
	.db $42
	.db $7E
	.db $3E
	.db $3C
	.db $7E
	.db $3E
	.db $3C
	.db $7E
	.db $3E
	.db $3C
	.db $7E
	.db $34
	.db $7E
	.db $7E
	.db $98
	.db $3C
	.db $90
	.db $34
	.db $3C
	.db $34
	.db $34
	.db $3C
	.db $34
	.db $3C
	.db $34
	.db $3C
	.db $90
	.db $34
	.db $3C
	.db $34
	.db $92
	.db $7E
	.db $98
	.db $3A
	.db $92
	.db $3E
	.db $3A
	.db $7E
	.db $3E
	.db $3A
	.db $7E
	.db $3E
	.db $7E
	.db $7E
	.db $98
	.db $48
	.db $92
	.db $46
	.db $48
	.db $7E
	.db $46

MusicDataOverworld4_Square1:
	.db $92
	.db $3E
	.db $7E
	.db $3A
	.db $38
	.db $7E
	.db $98
	.db $48
	.db $90
	.db $38
	.db $48
	.db $38
	.db $48
	.db $38
	.db $48
	.db $38
	.db $48
	.db $38
	.db $48
	.db $38
	.db $48
	.db $C2
	.db $7E
	.db $7E
	.db $7E
	.db $7E
	.db $46
	.db $7E
	.db $42
	.db $7E
	.db $3E
	.db $7E
	.db $3A
	.db $7E
	.db $36
	.db $7E

MusicDataOverworld3_Triangle:
	.db $88
	.db $30
	.db $34
	.db $38
	.db $3E
	.db $42
	.db $3E
	.db $38
	.db $30
	.db $34
	.db $38
	.db $3C
	.db $2A
	.db $82
	.db $34
	.db $7E
	.db $38
	.db $88
	.db $30
	.db $2E
	.db $2A
	.db $26
	.db $3E
	.db $3A
	.db $34
	.db $2E
	.db $26

MusicDataOverworld4_Triangle:
	.db $88
	.db $2A
	.db $2E
	.db $30
	.db $32
	.db $34
	.db $36
	.db $82
	.db $38
	.db $7E
	.db $2E
	.db $88
	.db $2A
	.db $26
	.db $2E

MusicDataOverworld5:
MusicDataOverworld5_Square2:
	.db $92
	.db $5A
	.db $7E
	.db $56
	.db $50
	.db $7E
	.db $9A
	.db $48
	.db $82
	.db $3C
	.db $3E
	.db $7E
	.db $40
	.db $42
	.db $7E
	.db $48
	.db $7E
	.db $7E
	.db $88
	.db $7E
	.db $82
	.db $48
	.db $88
	.db $7E
	.db $E2
	.db $7E
	.db $7E
	.db $50
	.db $00
MusicDataOverworld5_Square1:
	.db $92
	.db $48
	.db $7E
	.db $46
	.db $3E
	.db $7E
	.db $9A
	.db $38
	.db $88
	.db $7E
	.db $82
	.db $7E
	.db $3A
	.db $7E
	.db $38
	.db $7E
	.db $7E
	.db $88
	.db $7E
	.db $82
	.db $38
	.db $88
	.db $7E
	.db $E2
	.db $7E
	.db $7E
	.db $38
MusicDataOverworld5_Triangle:
	.db $2A
	.db $2E
	.db $30
	.db $26
	.db $2A
	.db $2E
	.db $30
	.db $82
	.db $7E
	.db $7E
	.db $30
	.db $88
	.db $7E
	.db $7E
MusicDataOverworld5_Noise:
	.db $88
	.db $06
	.db $82
	.db $02
	.db $01
	.db $02
	.db $00

MusicDataOverworld6:
MusicDataOverworld6_Square2:
	.db $E2
	.db $7E
	.db $7E
	.db $52
	.db $4E
	.db $7E
	.db $50
	.db $52
	.db $7E
	.db $4E
	.db $50
	.db $7E
	.db $E8
	.db $5E
	.db $E2
	.db $7E
	.db $E8
	.db $58
	.db $52
	.db $50
	.db $E2
	.db $4C
	.db $E0
	.db $50
	.db $4C
	.db $48
	.db $E2
	.db $46
	.db $7E
	.db $48
	.db $E2
	.db $4C
	.db $7E
	.db $48
	.db $46
	.db $7E
	.db $EA
	.db $48
	.db $E2
	.db $48
	.db $E8
	.db $46
	.db $48
	.db $E2
	.db $7E
	.db $7E
	.db $E8
	.db $4C
	.db $E2
	.db $7E
	.db $E8
	.db $4A
	.db $E2
	.db $4C
	.db $7E
	.db $E8
	.db $5A
	.db $E2
	.db $7E
	.db $E8
	.db $54
	.db $56
	.db $5A
	.db $EA
	.db $5E
	.db $5A
	.db $E8
	.db $58
	.db $E2
	.db $7E
	.db $7E
	.db $7E
	.db $56
	.db $7E
	.db $4C
	.db $46
	.db $7E
	.db $3E
	.db $00
MusicDataOverworld6_Square1:
	.db $E2
	.db $7E
	.db $7E
	.db $3A
	.db $36
	.db $7E
	.db $38
	.db $3A
	.db $7E
	.db $36
	.db $38
	.db $7E
	.db $E8
	.db $46
	.db $E2
	.db $7E
	.db $E8
	.db $40
	.db $3A
	.db $38
	.db $E2
	.db $34
	.db $E0
	.db $38
	.db $34
	.db $30
	.db $E2
	.db $2E
	.db $7E
	.db $30
	.db $E2
	.db $34
	.db $7E
	.db $30
	.db $2E
	.db $7E
	.db $EA
	.db $30
	.db $E2
	.db $30
	.db $E8
	.db $2E
	.db $30
	.db $E2
	.db $7E
	.db $7E
	.db $E8
	.db $34
	.db $E2
	.db $7E
	.db $E8
	.db $32
	.db $E2
	.db $34
	.db $7E
	.db $E8
	.db $42
	.db $E2
	.db $7E
	.db $E8
	.db $3C
	.db $3E
	.db $42
	.db $E2
	.db $46
	.db $7E
	.db $44
	.db $46
	.db $7E
	.db $5E
	.db $42
	.db $7E
	.db $40
	.db $42
	.db $7E
	.db $5A
	.db $40
	.db $7E
	.db $3E
	.db $40
	.db $7E
	.db $58
	.db $3E
	.db $7E
	.db $34
	.db $2E
	.db $7E
	.db $26
MusicDataOverworld6_Triangle:
	.db $88
	.db $38
	.db $46
	.db $40
	.db $3A
	.db $38
	.db $34
	.db $2E
	.db $28
	.db $2A
	.db $2E
	.db $30
	.db $34
	.db $38
	.db $30
	.db $2E
	.db $2A
	.db $34
	.db $38
	.db $3C
	.db $42
	.db $34
	.db $2A
	.db $34
	.db $3C
	.db $3E
	.db $3A
	.db $34
	.db $2E
	.db $34
	.db $2E
	.db $2A
	.db $26
MusicDataOverworld6_Noise:
	.db $88
	.db $06
	.db $82
	.db $10
	.db $01
	.db $10
	.db $00

MusicDataBoss:
MusicDataBoss_Square2:
	.db $94
	.db $34
	.db $36
	.db $36
	.db $34
	.db $36
	.db $36
	.db $34
	.db $36
	.db $34
	.db $36
	.db $36
	.db $34
	.db $36
	.db $36
	.db $34
	.db $36
	.db $34
	.db $36
	.db $36
	.db $34
	.db $36
	.db $36
	.db $34
	.db $36
	.db $34
	.db $36
	.db $36
	.db $34
	.db $36
	.db $36
	.db $34
	.db $36
	.db $38
	.db $3A
	.db $3A
	.db $38
	.db $3A
	.db $3A
	.db $38
	.db $3A
	.db $38
	.db $3A
	.db $3A
	.db $38
	.db $3A
	.db $3A
	.db $38
	.db $3A
	.db $38
	.db $3A
	.db $3A
	.db $38
	.db $3A
	.db $3A
	.db $38
	.db $3A
	.db $38
	.db $3A
	.db $3A
	.db $38
	.db $3A
	.db $3A
	.db $38
	.db $3A
	.db $00
MusicDataBoss_Square1:
	.db $94
	.db $7E
	.db $42
	.db $42
	.db $7E
	.db $42
	.db $42
	.db $7E
	.db $42
	.db $7E
	.db $42
	.db $42
	.db $7E
	.db $42
	.db $42
	.db $7E
	.db $42
	.db $7E
	.db $40
	.db $40
	.db $7E
	.db $40
	.db $40
	.db $7E
	.db $40
	.db $7E
	.db $40
	.db $40
	.db $7E
	.db $40
	.db $40
	.db $7E
	.db $40
	.db $7E
	.db $46
	.db $46
	.db $7E
	.db $46
	.db $46
	.db $7E
	.db $46
	.db $7E
	.db $46
	.db $46
	.db $7E
	.db $46
	.db $46
	.db $7E
	.db $46
	.db $7E
	.db $44
	.db $44
	.db $7E
	.db $44
	.db $44
	.db $7E
	.db $44
	.db $7E
	.db $44
	.db $44
	.db $7E
	.db $44
	.db $44
	.db $7E
	.db $44
MusicDataBoss_Triangle:
	.db $89
	.db $3C
	.db $3C
	.db $88
	.db $3C
	.db $89
	.db $3C
	.db $3C
	.db $88
	.db $3C
	.db $89
	.db $3A
	.db $3A
	.db $88
	.db $3A
	.db $89
	.db $3A
	.db $3A
	.db $88
	.db $3A
	.db $89
	.db $40
	.db $40
	.db $88
	.db $40
	.db $89
	.db $40
	.db $40
	.db $88
	.db $40
	.db $89
	.db $3E
	.db $3E
	.db $88
	.db $3E
	.db $89
	.db $3E
	.db $3E
	.db $88
	.db $3E

MusicDataWart:
MusicDataWart_Square2:
	.db $A9
	.db $56
	.db $54
	.db $A8
	.db $4C
	.db $A9
	.db $54
	.db $52
	.db $A8
	.db $4A
	.db $A9
	.db $52
	.db $50
	.db $A8
	.db $48
	.db $A4
	.db $4E
	.db $AB
	.db $4C
	.db $A4
	.db $7E
	.db $A9
	.db $5A
	.db $58
	.db $A8
	.db $50
	.db $A9
	.db $58
	.db $56
	.db $A8
	.db $4E
	.db $A9
	.db $56
	.db $54
	.db $A8
	.db $4C
	.db $A4
	.db $52
	.db $AB
	.db $50
	.db $A4
	.db $7E
	.db $4E
	.db $4C
	.db $4E
	.db $4C
	.db $4E
	.db $4C
	.db $4E
	.db $4C
	.db $50
	.db $4E
	.db $50
	.db $4E
	.db $50
	.db $4E
	.db $50
	.db $4E
	.db $52
	.db $50
	.db $52
	.db $50
	.db $52
	.db $50
	.db $52
	.db $50
	.db $54
	.db $52
	.db $54
	.db $52
	.db $54
	.db $52
	.db $54
	.db $52
	.db $00
MusicDataWart_Square1:
	.db $A9
	.db $44
	.db $42
	.db $A8
	.db $3A
	.db $A9
	.db $42
	.db $40
	.db $A8
	.db $38
	.db $A9
	.db $40
	.db $3E
	.db $A8
	.db $36
	.db $A4
	.db $3C
	.db $AB
	.db $3A
	.db $A4
	.db $7E
	.db $A9
	.db $48
	.db $46
	.db $A8
	.db $3E
	.db $A9
	.db $46
	.db $44
	.db $A8
	.db $3C
	.db $A9
	.db $44
	.db $42
	.db $A8
	.db $3A
	.db $A4
	.db $42
	.db $AB
	.db $40
	.db $A4
	.db $7E
	.db $A4
	.db $42
	.db $40
	.db $42
	.db $40
	.db $42
	.db $40
	.db $42
	.db $40
	.db $44
	.db $42
	.db $44
	.db $42
	.db $44
	.db $42
	.db $44
	.db $42
	.db $46
	.db $44
	.db $46
	.db $44
	.db $46
	.db $44
	.db $46
	.db $44
	.db $48
	.db $46
	.db $48
	.db $46
	.db $48
	.db $46
	.db $48
	.db $46
MusicDataWart_Triangle:
	.db $84
	.db $3E
	.db $42
	.db $44
	.db $3E
	.db $42
	.db $44
	.db $3E
	.db $44
	.db $3E
	.db $42
	.db $44
	.db $3E
	.db $42
	.db $44
	.db $3E
	.db $44
	.db $3E
	.db $42
	.db $44
	.db $3E
	.db $42
	.db $44
	.db $3E
	.db $44
	.db $3E
	.db $42
	.db $44
	.db $3E
	.db $42
	.db $44
	.db $3E
	.db $44
	.db $3C
	.db $40
	.db $42
	.db $3C
	.db $40
	.db $42
	.db $3C
	.db $42
	.db $3C
	.db $40
	.db $42
	.db $3C
	.db $40
	.db $42
	.db $3C
	.db $42
	.db $3C
	.db $40
	.db $42
	.db $3C
	.db $40
	.db $42
	.db $3C
	.db $42
	.db $3C
	.db $40
	.db $42
	.db $3C
	.db $40
	.db $42
	.db $3C
	.db $42
	.db $84
	.db $3A
	.db $88
	.db $3A
	.db $3A
	.db $3A
	.db $84
	.db $3A
	.db $3C
	.db $88
	.db $3C
	.db $3C
	.db $3C
	.db $84
	.db $3C
	.db $3E
	.db $88
	.db $3E
	.db $3E
	.db $3E
	.db $84
	.db $3E
	.db $40
	.db $88
	.db $40
	.db $40
	.db $40
	.db $84
	.db $40

MusicDataMushroomBonusChance:
MusicDataMushroomBonusChance_Square2:
	.db $82
	.db $46
	.db $48
	.db $4A
	.db $4C
	.db $7E
	.db $56
	.db $88
	.db $52
	.db $00
MusicDataMushroomBonusChance_Square1:
	.db $82
	.db $3E
	.db $42
	.db $44
	.db $46
	.db $7E
	.db $50
	.db $88
	.db $4C

MusicDataGameOver:
MusicDataGameOver_Square2:
	.db $94
	.db $56
	.db $5A
	.db $60
	.db $3E
	.db $42
	.db $48
	.db $26
	.db $2A
	.db $98
	.db $30
	.db $26
	.db $30
	.db $00
MusicDataGameOver_Square1:
	.db $98
	.db $7E
	.db $94
	.db $30
	.db $98
	.db $7E
	.db $94
	.db $30
	.db $98
	.db $7E
	.db $30
	.db $3A
	.db $38
MusicDataGameOver_Triangle:
	.db $88
	.db $7E
	.db $89
	.db $60
	.db $48
	.db $88
	.db $30
	.db $3E
	.db $30

MusicDataBossBeaten:
MusicDataBossBeaten_Square2:
	.db $94
	.db $42
	.db $48
	.db $4C
	.db $42
	.db $48
	.db $4C
	.db $3E
	.db $42
	.db $50
	.db $3E
	.db $42
	.db $52
	.db $50
	.db $48
	.db $42
	.db $7E
	.db $3A
	.db $42
	.db $48
	.db $50
	.db $4C
	.db $3E
	.db $42
	.db $7E
	.db $30
	.db $7E
	.db $26
	.db $2A
	.db $7E
	.db $26
	.db $20
	.db $7E
	.db $98
	.db $18
	.db $26
	.db $30
	.db $7E
	.db $00
MusicDataBossBeaten_Square1:
	.db $88
	.db $7E
	.db $30
	.db $7E
	.db $30
	.db $7E
	.db $34
	.db $7E
	.db $38
	.db $7E
	.db $42
	.db $7E
	.db $46
	.db $48
	.db $94
	.db $3E
	.db $98
	.db $42
	.db $94
	.db $3E
	.db $98
	.db $38
	.db $30
	.db $7E
	.db $9A
	.db $48
MusicDataBossBeaten_Triangle:
	.db $88
	.db $3A
	.db $52
	.db $3C
	.db $54
	.db $3E
	.db $56
	.db $42
	.db $5A
	.db $4C
	.db $3A
	.db $3E
	.db $4C
	.db $48
	.db $7E
	.db $7E
	.db $7E
	.db $48
	.db $3E
	.db $30
	.db $7E

MusicDataCrystal:
MusicDataCrystal_Square2:
	.db $89
	.db $40
	.db $84
	.db $40
	.db $88
	.db $40
	.db $88
	.db $56
	.db $56
	.db $52
	.db $8B
	.db $50
	.db $00
MusicDataCrystal_Square1:
	.db $89
	.db $36
	.db $84
	.db $36
	.db $88
	.db $36
	.db $88
	.db $44
	.db $88
	.db $44
	.db $88
	.db $40
	.db $8B
	.db $3E
MusicDataCrystal_Triangle:
	.db $89
	.db $40
	.db $84
	.db $40
	.db $88
	.db $40
	.db $88
	.db $4E
	.db $4E
	.db $4A
	.db $8B
	.db $48

MusicDataDeath:
MusicDataDeath_Square2:
	.db $84
	.db $7E
	.db $82
	.db $4E
	.db $7E
	.db $46
	.db $3E
	.db $7E
	.db $3A
	.db $8A
	.db $38
	.db $00
MusicDataDeath_Square1:
	.db $84
	.db $7E
	.db $82
	.db $3E
	.db $7E
	.db $34
	.db $2E
	.db $7E
	.db $2A
	.db $8A
	.db $26
MusicDataDeath_Triangle:
	.db $84
	.db $7E
	.db $88
	.db $46
	.db $3E
	.db $8A
	.db $30
