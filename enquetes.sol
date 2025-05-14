// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Enquete {
    struct OpcaoVoto{
        string descricao;
        uint256 quantidade;
    }

    struct EnqueteInfo{
        string titulo;
        address criador;
        bool ativa;
        OpcaoVoto[] opcoes;
        mapping(address => bool) jaVotou;
    }

    mapping(uint256 => EnqueteInfo) private enquetes;
    uint private contadorEnquete;

    // Enquete é criada
    // Enquete né registrada
    // Enquete é encerrada

    event EnqueteCriada(uint256 idEnquete, string titulo, address criador);
    event VotoRegistrado(uint256 idEnquete, uint256 indiceOpcao, address votante);
    event EnqueteEncerrada(uint256 idEnquete, address criador);

    function criarEnquete(string memory _titulo, string[] memory _opcoes) external {
        require(_opcoes.length >= 2 && _opcoes.length <= 10, unicode"A quantidade de opções deve ser entre 2 e 10.");

        contadorEnquete++;
        EnqueteInfo storage novaEnquete = enquetes[contadorEnquete];
        novaEnquete.titulo = _titulo;
        novaEnquete.criador = msg.sender;
        novaEnquete.ativa = true;
    
        for (uint256 i = 0; i < _opcoes.length; i++)
        {
            novaEnquete.opcoes.push(OpcaoVoto({descricao: _opcoes[i], quantidade: 0 }));
        }

        emit EnqueteCriada(contadorEnquete, _titulo, msg.sender);
    }

    function Votar(uint256 _idEnquete, uint256 _indiceOpcao) external {
        EnqueteInfo storage enquete = enquetes[_idEnquete];
        require(enquete.ativa, unicode"Esta enquete está encerrada");
        require(!enquete.jaVotou[msg.sender], unicode"Você já votou neste voto.");
        require(_indiceOpcao < enquete.opcoes.length, unicode"Opção inválida");

        enquete.opcoes[_indiceOpcao].quantidade++;
        enquete.jaVotou[msg.sender] = true;

        emit VotoRegistrado(_idEnquete, _indiceOpcao, msg.sender);
    }

    function EncerrarEnquete(uint256 _idEnquete) external {
        EnqueteInfo storage enquete = enquetes[_idEnquete];
        require(enquete.ativa, unicode"Esta enquete já está ativa.");
        require(enquete.criador == msg.sender, unicode"Somente o criador pode encerrar a enquete");

        enquete.ativa = false;

        emit EnqueteEncerrada(_idEnquete, msg.sender);
    }

    function obterEnquete(uint256 _idEnquete) external view returns(
        string memory titulo,
        bool ativa,
        string[] memory nomesOpcoes,
        uint256[] memory votosOpcoes
    ) {
        EnqueteInfo storage enquete = enquetes[_idEnquete];

        uint256 totalOpcoes = enquete.opcoes.length;
        nomesOpcoes = new string[](totalOpcoes);
        votosOpcoes = new uint256[](totalOpcoes);

        for(uint256 i = 0; i < totalOpcoes; i++){
            nomesOpcoes[i] = enquete.opcoes[i].descricao;
            votosOpcoes[i] = enquete.opcoes[i].quantidade;
        }

        return (enquete.titulo, enquete.ativa, nomesOpcoes, votosOpcoes);
    }

}
