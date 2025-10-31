// Define um conjunto de testes para a função saudacao
describe("Função de Saudação Simples", function() {

    // Teste 1: Deve retornar a saudação correta quando um nome é fornecido
    it("deve retornar a saudação com o nome fornecido", function() {
        // A função 'saudacao' é definida no script.js
        const resultado = saudacao("Fábio");
        expect(resultado).toBe("Olá, Fábio!");
    });

    // Teste 2: Deve retornar a saudação padrão se nenhum nome for fornecido
    it("deve retornar a saudação padrão se nenhum nome for fornecido", function() {
        const resultado = saudacao("");
        expect(resultado).toBe("Olá, Visitante!");
    });
});