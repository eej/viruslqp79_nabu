prog_end

		MODULE		MWORK
		OUTPUT		"work.bin"
		ORG			prog_end
work_start		
;============================================
; CONSTANTS
;============================================
K_MAX_NUMBER_OF_SPRITES         EQU 13
K_EOF				EQU 254	
K_NORMAL_SHOOT                  EQU 0
K_DOUBLE_SHOOT                  EQU 1
K_TRIPLE_SHOOT                  EQU 3
K_START_LEVEL 			EQU 1			; 1 BASED
K_START_MAP 			EQU K_START_LEVEL-1	; 0 BASED
K_MAX_BULLETS_COUNT		EQU 24
K_INITIAL_PLAYER_LIVES		EQU 10
K_MAX_NUMBER_OF_ZOMBIES		EQU 10
K_MAX_NUMBER_OF_FIXED_INDESTRUCTIBLES EQU 4+1+4		
K_MAX_NUMBER_OF_SHOOTS		EQU 4
K_DATA_PER_ENTITY		EQU 14			
K_MAX_NUMBER_OF_INDESTRUCTIBLES EQU K_MAX_NUMBER_OF_FIXED_INDESTRUCTIBLES+K_MAX_NUMBER_OF_SHOOTS							
K_ENTITIES_LENGTH 		EQU K_MAX_NUMBER_OF_ZOMBIES+K_MAX_NUMBER_OF_INDESTRUCTIBLES							
K_ZOMBIES_SPEED			EQU 14
;============================================
; MUSIC VARS
;============================================
BUFF_CANAL_A			block 16
BUFF_CANAL_B			block 16    
BUFF_CANAL_C			block 16
BUFF_CANAL_P			block 16
INTERR				block (150+32)


;============================================
; GAME VARS
;============================================
ANIMATION_TICK		block 1				; CLOCK FOR ANIMATIONS AND RANDOM NUMBERS
ZOMBIES_ANIMATION_TICK	block 1
ZOMBIES_SPEED		block 1
NUM_OF_CONTINUES	block 1
ALREADY_CONTINUE	block 1				; IF HAS CONTINUED DON'T SHOW LAST INTERMISSION OR HALF PATH SCREEN
PLAYER_SHOOT_TYPE       block 1                              ; K_NORMAL_SHOOT, K_DOUBLE_SHOOT, K_TRIPLE_SHOOT
PLAYER_SHOOT_COST       block 1
KEY_PRESSED             block 1                              ; 0 NO, 1 YES
RUN_NUMBER              block 1                              ; 0 FIRST RUN, 1 SECOND RUN
CURRENT_NUMBER_OF_SHOOTS block 1                             
PLAYER_POINTS           block 3                              
HI_SCORE		block 3
TICK_REFRESH		block 1
LEVEL			block 1
PLAYER_BULLETS		block 1
PLAYER_SHOOT_WAIT	block 1  				; COUNTER TO ALLOW OTHER SHOOT
CHARGE_BULLETS_COUNTER	block 1
CURRENT_NUMBER_OF_ZOMBIES block 1
PRE_GAME_OVER		block 1
SURVIVORS_TO_SAVE	block 1
CURRENT_ZOMBIE_TYPE	block 1
SHOOTS_TO_KILL_ZOMBIE	block 1	
COUNT_DOWN		block 4 
CURRENT_SONG		block 1


;===========================================
; PLAYER VARS
;===========================================
PLAYER_KEY_PRESSED 	block 1
PLAYER_SPACE_KEY_PRESSED block 1  				; TO CONTROL SHOOT
PLAYER_LIVES		block 1
PLAYER_IMMUNITY		block 1
PLAYER_Y 		block 1
PLAYER_X 		block 1	
PLAYER_DIRECTION	block 1				; LIKE JOYSTICK CODES
PLAYER_PREVIOUS_Y	block 1				; TO UNDO MOVEMENT
PLAYER_PREVIOUS_X	block 1
   



;============================================
; FUNCTION PARAMETERS AND LOCAL VARS
;============================================
ENTITY_EXIT		block 1
ENTITY_EXIT_MAP_Y	block 1
ENTITY_EXIT_MAP_X	block 1

 ;CanGo
PARAM_CAN_GO_Y          block 1
PARAM_CAN_GO_X		block 1

CHECK_COLISION_POS	block 2

TMP_Y			block 1
TMP_X			block 1

TRATE_ZOMBIE_PREV_POS   block 2
TRATE_ZOMBIE_FIRST_OPTION block 1



;============================================
; SCREEN VARS
;============================================
CAMERA_SCREEN           block (32*24)                        
CAMERA_OFFSET           block 2                              ; TOP-LEFT CORNER ADDRESS OF THE CAMERA IN THE MAP
CAMERA_CHANGED		block 1
INTER_SCROLL_COUNTER_X	block 1			 	; CONTROL THE 8PX HORIZONTAL SCROLL
INTER_SCROLL_COUNTER_Y	block 1				; CONTROL THE 8PX VERTICAL SCROLL
CAMERA_TILE_Y_TOP    	block 1				; TOP CAMERA POSITION IN TILED MAP
CAMERA_TILE_X_LEFT	block 1
CAMERA_TILE_Y_DOWN	block 1
CAMERA_TILE_X_RIGHT	block 1
PLAYER_PATTERN		block 2

TMP_COUNTER             block 2
TMP_UNZIP		block (32*8*8)


;============================================
; OPERATION VARS
;============================================
CURRENT_SPRITES_TABLE   block 2
CURRENT_SPRITES_TABLE_POSITION block 2

SPRITES_TABLE		block 0
SPRITES_TABLE_0         block 4
SPRITES_TABLE_1         block 4
SPRITES_TABLE_2         block 4
SPRITES_TABLE_3         block 4
SPRITES_TABLE_4         block 4
SPRITES_TABLE_5         block 4
SPRITES_TABLE_6         block 4
SPRITES_TABLE_7         block 4
SPRITES_TABLE_8         block 4
SPRITES_TABLE_9         block 4
SPRITES_TABLE_10        block 4
SPRITES_TABLE_11        block 4

LIST_ENTITIES_DATA			block 0
LIST_DESTRUCTIBLE_ENTITIES_DATA		block (K_MAX_NUMBER_OF_ZOMBIES*K_DATA_PER_ENTITY)
LIST_INDESTRUCTIBLE_ENTITIES_DATA	block (K_MAX_NUMBER_OF_FIXED_INDESTRUCTIBLES*K_DATA_PER_ENTITY)
LIST_SHOOTS				block (K_MAX_NUMBER_OF_SHOOTS*K_DATA_PER_ENTITY)
LIST_ENTITIES_DATA_END			block 1


THE_MAP                 block (64*32)
work_end
		ENDMODULE