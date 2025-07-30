-- Carregar a biblioteca Redz Hub UI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/main/Redzhubui"))()

-- Configurações do tema XENP
local XENP_COLORS = {
    Main = Color3.fromRGB(138, 0, 0),
    Secondary = Color3.fromRGB(50, 50, 70),
    Text = Color3.fromRGB(255, 255, 255),
    ButtonHover = Color3.fromRGB(100, 0, 0)
}

-- Criar janela principal
local Window = Library:CreateWindow("XENP - RECRUTAMENTO", {
    main_color = XENP_COLORS.Main,
    min_size = Vector2.new(350, 450),
    toggle_key = Enum.KeyCode.RightShift,
    can_resize = true
})

-- Adicionar botão de minimizar
Window:AddMinimizeButton({
    Button = {
        Image = "rbxassetid://3926307971", -- Ícone padrão (substitua se quiser)
        BackgroundColor3 = XENP_COLORS.Secondary,
        BackgroundTransparency = 0,
        Size = UDim2.new(0, 25, 0, 25),
        Position = UDim2.new(1, -35, 0, 10)
    },
    Corner = {
        CornerRadius = UDim.new(0, 8),
        CornerRadiusType = "Pixel"
    }
})

-- Função para enviar mensagem
function SendMessage(message)
    Library:Notify("XENP", "Comando executado!", 2)
    local chatService = game:GetService("TextChatService")
    local rbxChannel = chatService:FindFirstChild("TextChannels") and chatService.TextChannels:FindFirstChild("RBXGeneral")
    if rbxChannel then
        rbxChannel:SendAsync(message)
    else
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
    end
end

-- === Aba PORTÃO ===
local PortaoTab = Window:CreateTab("PORTÃO")
local PortaoSection = PortaoTab:CreateSection("Comandos do Portão")

local portaoCommands = {
    {"Iniciar recrutamento", "Saudações. Darei início ao alistamento militar dos senhores."},
    {"Instruções do portão", "Quando o portão descer, caminhem para frente do scanner, aguardando novas instruções."},
    {"Área demarcada", "Sair da área demarcada em amarelo causará anulação da sua candidatura no exército."},
    {"Proibido ultrapassar", "Proibido ultrapassar o scanner sem permissão, aquele que praticar tal ato estará sujeito a reprovação."},
    {"Linha branca", "Quem eu tocar poderá passar pelo scanner e se dirigir à linha branca."}
}

for _, cmd in ipairs(portaoCommands) do
    PortaoSection:CreateButton(cmd[1], function()
        SendMessage(cmd[2])
    end)
end

-- === Aba AVISOS ===
local AvisosTab = Window:CreateTab("AVISOS")
local AvisosSection = AvisosTab:CreateSection("Regras Importantes")

local warnings = {
    {"Área restrita", "1 - Não saiam da área do recrutamento, esta área é restrita e serão abatidos caso estejam sozinhos."},
    {"Uso da gramática", "2 - Uso obrigatório da gramática (escrever corretamente)."},
    {"Tratamento correto", "3 - Refiram-se à mim como 'Cabo'."},
    {"Posição de sentido", "4 - Quando fizermos uma marcha, façam em posição de sentido e sem correr."},
    {"Proibido gracinhas", "5 - Sem gracinhas (já devem imaginar o motivo)."},
    {"Respostas adequadas", "6 - No recrutamento, sempre respondam as perguntas com 'Sim, Cabo.' ou 'Não, Cabo.'"},
    {"Duração do treino", "7 - O recrutamento costuma demorar cerca de 1 hora."},
    {"Inatividade", "8 - Inatividade sem aviso prévio causará reprovação imediata."}
}

for _, warning in ipairs(warnings) do
    AvisosSection:CreateButton(warning[1], function()
        SendMessage(warning[2])
    end)
end

-- === Aba GRAMÁTICA ===
local GramaticaTab = Window:CreateTab("GRAMÁTICA")
local GramaticaSection = GramaticaTab:CreateSection("Regras Gramaticais")

local grammarRules = {
    {"Etapa 1: Acento", "1 - Iniciem a frase com letra maiúscula, e não coloquem o acento til (~) na letra 'a'."},
    {"Etapa 2: Vírgula", "2 - Após a afirmação (Não/Sim), use vírgula e espaço."},
    {"Etapa 3: Maiúsculas", "3 - A letra 'C' de Cabo deve ser maiúscula."},
    {"Etapa 4: Pontuação", "4 - Termine com ponto final. 4 erros causam reprovação."}
}

for _, rule in ipairs(grammarRules) do
    GramaticaSection:CreateButton(rule[1], function()
        SendMessage(rule[2])
    end)
end

-- === Aba GRUPO ===
local GrupoTab = Window:CreateTab("GRUPO")
local GrupoSection = GrupoTab:CreateSection("Entrar no Grupo")

local groupSteps = {
    {"1. Acessar descrição", "Acesse a descrição do jogo pelo ícone para entrar no jogo."},
    {"2. Encontrar Comunidades", "Desça no menu até achar 'Comunidades'."},
    {"3. Enviar solicitação", "Na página do grupo, clique em 'Enviar Solicitação'."},
    {"4. Aguardar aceitação", "Aceitaremos em até 10 minutos e você se tornará Recruta."}
}

for _, step in ipairs(groupSteps) do
    GrupoSection:CreateButton(step[1], function()
        SendMessage(step[2])
    end)
end

-- Notificação inicial
Library:Notify("XENP Recruitment", "Painel carregado com sucesso! Pressione RightShift para alternar.", 5)
