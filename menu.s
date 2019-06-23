.data
	# Variáveis com endereços de memória dos botões
	up_addr: .word 0x2070
	down_addr: .word 0x2090
	sel_addr: .word 0x2080
	back_addr: .word 0x2060

	# Variável com o endereço de memória de controle dos LEDs.
	# Vetor de 5 posições com cada uma delas representando um LED
	led_addr: .word 0x20B0 // Necessário mandar um número representando a combinação
												 // em binário dos LEDS utilizando a lógica invertida (0- on, 1- off)
												 // ex: Dec: 10 -> 01010 (acende os LEDs 1, 3 e 5)

	# Variáveis com os comandos para inicialização da LCD
	.equ lcd_set, 0x30 // Set
	.equ lcd_wakeup, 0x39 // Wakeup
	.equ lcd_osc_control, 0x14 // Internal OSC Frequency control
	.equ lcd_power_control, 0x56 // Power control
	.equ lcd_follower_control, 0x6D // Follower control
	.equ lcd_contrast, 0x70 // Contrast set
	.equ lcd_display_on_off, 0x0C // Display on/off control
	.equ lcd_entry_mode_set, 0x06 // Entry mode set
	.equ lcd_clear, 0x01 // Clear display

.text
.global _start
	_start:
		# Início do Programas
		br initializeLCD

	initializeLCD: // Label com todos os comandos para a inicialização completa da LCD
		call delay

		# LCD Set
		movia r13, lcd_set
		custom 0, r15, r13, r13
		call delay

		# LCD Set
		movia r13, lcd_set
		custom 0, r15, r13, r13
		call delay

		# LCD Wakeup
		movia r13, lcd_wakeup
		custom 0, r15, r13, r13
		call delay

		# LCD OSC Frequency Control
		movia r13, lcd_osc_control
		custom 0, r15, r13, r13
		call delay

		# LCD Power Control
		movia r13, lcd_power_control
		custom 0, r15, r13, r13
		call delay

		# LCD Follower Control
		movia r13, lcd_follower_control
		custom 0, r15, r13, r13
		call delay

		# LCD Contrast
		movia r13, lcd_contrast
		custom 0, r15, r13, r13
		call delay

		# LCD Display On/Off Control
		movia r13, lcd_display_on_off
		custom 0, r15, r13, r13
		call delay

		# LCD Entry Mode Set
		movia r13, lcd_entry_mode_set
		custom 0, r15, r13, r13
		call delay

		# LCD Clear
		movia r13, lcd_clear
		custom 0, r15, r13, r13
		call delay

		# Fim da inicialização da LCD. Branch para o início do código do menu
		br menu1

	menu1: // Label para escrever o conteúdo da LCD (chamada apenas 1 vez por estado)
		# Limpa o display antes de escrever
		movia r14, lcd_clear
		custom 0, r15, r14, r14
		call delay

		# Número 1 na LCD com RS em 1 e RW em 0 (1000110001)
		movia r14, 0x231
		custom 0, r15, r14, r14
		call delay

		br loop_menu1

	loop_menu1: // Label para o loop da verificação dos botões
		# Lógica de verificar se o botão foi pressionado (Select) [Serve para todos os botões]
		movia r12, sel_addr   # Salva o endereço da variável do botão (nesse caso sel_addr) no registrador R12
		ldwio r12, 0(r12)     # Lê o conteúdo de R12 (Endereço de memória do GPIO)
		ldwio r12, 0(r12)     # Lê o conteúdo de R12 (Valor real salvo no endereço lido do GPIO)
		movi r11, 1           # Adiciona ao R11 o valor a ser verificado no botão
		beq r12, r11, sel1    # Verifica se o valor do GPIO é igual ao valor de R11 e vai para o próximo estado

		# Lógica de verificar se o botão foi pressionado (Up)
		movia r12, up_addr
		ldwio r12, 0(r12)
		ldwio r12, 0(r12)
		movi r11, 1
		beq r12, r11, menu5

		# Lógica de verificar se o botão foi pressionado (Down)
		movia r12, down_addr
		ldwio r12, 0(r12)
		ldwio r12, 0(r12)
		movi r11, 1
		beq r12, r11, menu2

		# Volta para o começo do estado caso nada tenha sido pressionado
		br loop_menu1

	menu2:
		movia r14, lcd_clear # Limpa o display antes de escrever
		custom 0, r15, r14, r14
		call delay

		movia r14, 0x232	# Número 2 na LCD com RS em 1 e RW em 0 (1000110010)
		custom 0, r15, r14, r14
		call delay

		br loop_menu2

	loop_menu2:
		# Lógica de verificar se o botão foi pressionado (Select)
		movia r12, sel_addr
		ldwio r12, 0(r12)
		ldwio r12, 0(r12)
		movi r11, 1
		beq r12, r11, sel2

		# Lógica de verificar se o botão foi pressionado (Up)
		movia r12, up_addr
		ldwio r12, 0(r12)
		ldwio r12, 0(r12)
		movi r11, 1
		beq r12, r11, menu1

		# Lógica de verificar se o botão foi pressionado (Down)
		movia r12, down_addr
		ldwio r12, 0(r12)
		ldwio r12, 0(r12)
		movi r11, 1
		beq r12, r11, menu3

		# Volta para o começo do estado caso nada tenha sido pressionado
		br loop_menu2

  menu3:
		movia r14, lcd_clear # Limpa o display antes de escrever
		custom 0, r15, r14, r14
		call delay

		movia r14, 0x233	# Número 3 na LCD com RS em 1 e RW em 0 (1000110011)
		custom 0, r15, r14, r14
		call delay

		br loop_menu3

	loop_menu3:
		# Lógica de verificar se o botão foi pressionado (Select)
		movia r12, sel_addr
		ldwio r12, 0(r12)
		ldwio r12, 0(r12)
		movi r11, 1
		beq r12, r11, sel3

		# Lógica de verificar se o botão foi pressionado (Up)
		movia r12, up_addr
		ldwio r12, 0(r12)
		ldwio r12, 0(r12)
		movi r11, 1
		beq r12, r11, menu2

		# Lógica de verificar se o botão foi pressionado (Down)
		movia r12, down_addr
		ldwio r12, 0(r12)
		ldwio r12, 0(r12)
		movi r11, 1
		beq r12, r11, menu4

		# Volta para o começo do estado caso nada tenha sido pressionado
		br loop_menu3

	menu4:
		movia r14, lcd_clear # Limpa o display antes de escrever
		custom 0, r15, r14, r14
		call delay

		movia r14, 0x234	# Número 4 na LCD com RS em 1 e RW em 0 (1000110100)
		custom 0, r15, r14, r14
		call delay

		br loop_menu4

	loop_menu4:
		# Lógica de verificar se o botão foi pressionado (Select)
		movia r12, sel_addr
		ldwio r12, 0(r12)
		ldwio r12, 0(r12)
		movi r11, 1
		beq r12, r11, sel4

		# Lógica de verificar se o botão foi pressionado (Up)
		movia r12, up_addr
		ldwio r12, 0(r12)
		ldwio r12, 0(r12)
		movi r11, 1
		beq r12, r11, menu3

		# Lógica de verificar se o botão foi pressionado (Down)
		movia r12, down_addr
		ldwio r12, 0(r12)
		ldwio r12, 0(r12)
		movi r11, 1
		beq r12, r11, menu5

		# Volta para o começo do estado caso nada tenha sido pressionado
		br loop_menu4

	menu5:
		movia r14, lcd_clear # Limpa o display antes de escrever
		custom 0, r15, r14, r14
		call delay

		movia r14, 0x235	# Número 5 na LCD com RS em 1 e RW em 0 (1000110101)
		custom 0, r15, r14, r14
		call delay

		br loop_menu5

	loop_menu5
		# Lógica de verificar se o botão foi pressionado (Select)
		movia r12, sel_addr
		ldwio r12, 0(r12)
		ldwio r12, 0(r12)
		movi r11, 1
		beq r12, r11, sel5

		# Lógica de verificar se o botão foi pressionado (Up)
		movia r12, up_addr
		ldwio r12, 0(r12)
		ldwio r12, 0(r12)
		movi r11, 1
		beq r12, r11, menu4

		# Lógica de verificar se o botão foi pressionado (Down)
		movia r12, down_addr
		ldwio r12, 0(r12)
		ldwio r12, 0(r12)
		movi r11, 1
		beq r12, r11, menu1

		# Volta para o começo do estado caso nada tenha sido pressionado
		br loop_menu5

	sel1:
		# Lógica de acender o LED específico do estado
		movia r12, led_addr   # Salva o endereço da variável led_addr no registrador R12
		ldwio r12, 0(r12)     # Lê o conteúdo do endereço de memória salvo (encontrando o endereço do GPIO do LED)
 		movi r9, 0x1E           # Adiciona ao R9 o valor correspondente à combinação de LEDs que deverá ser acesa
		stw r9, 0(r12)        # Escreve o valor de R9 na posição de memória do LED

		br loop_sel1

	loop_sel1:
		# Lógica de verificar se o botão foi pressionado (Back)
		movia r12, back_addr
		ldwio r12, 0(r12)
		ldwio r12, 0(r12)
		movi r11, 1
		beq r12, r11, menu1

		# Volta para o começo do estado caso nada tenha sido pressionado
		br loop_sel1

	sel2:
		# Lógica de acender o LED específico do estado
		movia r12, led_addr
		ldwio r12, 0(r12)
		movi r9, 0x1D
		stw r9, 0(r12)

		br loop_sel2

	loop_sel2:
		# Lógica de verificar se o botão foi pressionado (Back)
		movia r12, back_addr
		ldwio r12, 0(r12)
		ldwio r12, 0(r12)
		movi r11, 1
		beq r12, r11, menu2

		# Volta para o começo do estado caso nada tenha sido pressionado
		br loop_sel2

	sel3:
		# Lógica de acender o LED específico do estado
		movia r12, led_addr
		ldwio r12, 0(r12)
		movi r9, 0x1B
		stw r9, 0(r12)

		br loop_sel3

	loop_sel3:
		# Lógica de verificar se o botão foi pressionado (Back)
		movia r12, back_addr
		ldwio r12, 0(r12)
		ldwio r12, 0(r12)
		movi r11, 1
		beq r12, r11, menu3

		# Volta para o começo do estado caso nada tenha sido pressionado
		br loop_sel3

	sel4:
		# Lógica de acender o LED específico do estado
		movia r12, led_addr
		ldwio r12, 0(r12)
		movi r9, 0x17
		stw r9, 0(r12)

		br loop_sel4

	loop_sel4:
		# Lógica de verificar se o botão foi pressionado (Back)
		movia r12, back_addr
		ldwio r12, 0(r12)
		ldwio r12, 0(r12)
		movi r11, 1
		beq r12, r11, menu4

		# Volta para o começo do estado caso nada tenha sido pressionado
		br loop_sel4

	sel5:
		# Lógica de acender o LED específico do estado
		movia r12, led_addr
		ldwio r12, 0(r12)
		movi r9, 10
		stw r9, 0(r12)

		br loop_sel5

	loop_sel5:
		# Lógica de verificar se o botão foi pressionado (Down)
		movia r12, back_addr
		ldwio r12, 0(r12)
		ldwio r12, 0(r12)
		movi r11, 1
		beq r12, r11, menu5

		# Volta para o começo do estado caso nada tenha sido pressionado
		br loop_sel5

	delay:
		# Valor para contagem de ciclos necessárias a se criar um delay de aproximadamente 200ms
		movia r4, 0x4C4BA4
		# Contador
		addi r5, r5, 1
		bne r5, r4, delay
		# Zera o registrador ao sair do contador
		mov r5, r0
		ret

	# Label para encerrar o programa (Não utilizado pois se trata de um loop)
	end:
		br end
		.end
