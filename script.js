// A função que contém a lógica que queremos testar (Função Pura)
function saudacao(nome) {
    if (nome && typeof nome === 'string' && nome.trim() !== '') {
        return "Olá, " + nome + "!";
    } else {
        return "Olá, Visitante!";
    }
}

// Lógica de interação com o DOM (para o site real)
document.addEventListener('DOMContentLoaded', function() {
    const botao = document.getElementById('meuBotao');
    const divSaudacao = document.getElementById('saudacao-texto');

    if (botao && divSaudacao) {
        botao.addEventListener('click', function() {
            // Chamamos a função com um valor de exemplo
            const nomeDoUsuario = "Fábio"; 
            divSaudacao.textContent = saudacao(nomeDoUsuario);
            
            // Exemplo de notificação:
            console.log("A função saudacao foi executada no navegador.");
        });
    }
});

// Nota: Em um ambiente de teste moderno (como Node/Jest), você exportaria a função.
// Como estamos em um ambiente simples de navegador, ela está disponível globalmente.
