<?php
include_once("config.php");
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Recebe os dados do formulário
    $nome = $_POST['name'];
    $cpf = $_POST['cpf'];
    $telefone = $_POST['telefone'];
    $email = $_POST['email'];
    $nome_usuario = $_POST['nome_usuario'];
    $senha = $_POST['senha']; // Criptografando a senha
    $rua = $_POST['rua'];
    $numero = $_POST['numero'];
    $complemento = $_POST['complemento'];
    $bairro = $_POST['bairro'];
    $cidade = $_POST['cidade'];
    $cep = $_POST['cep'];

    
    // Prepara a query SQL (utilizando prepared statements para segurança)
    $stmt = $conexao->prepare("INSERT INTO clientes (nome, cpf, telefone, email, nome_usuario, senha, rua, numero, complemento, bairro, cidade, cep) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("ssssssssssss", $nome, $cpf, $telefone, $email, $nome_usuario, $senha, $rua, $numero, $complemento, $bairro, $cidade, $cep);

    // Executa a query
    if ($stmt->execute()) {
        echo "Novo registro criado com sucesso";
    } else {
        echo "Erro ao criar registro: " . $stmt->error;
    }

    // Fecha a conexão
    $stmt->close();
    $conexao->close();

    // Redireciona para uma página de sucesso (ajuste o URL)
    header("Location: cadastro.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro e Login</title>
    <link rel="stylesheet" href="cadastro.css">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
    <!-- Cabeçalho -->
    <header class="header">
        <div class="logo">
            <img src="8aa3aa05-988a-418e-aadc-c7f4ae73d73d-removebg-preview.png" alt="Logo do Gato Café" class="logo-img">
            <h1>Coffe&Cats</h1>
        </div>
        <div class="cadastro">
            <button class="cadastro-btn">Cadastrar <a href="cadastro.html"></a></button>
        </div>
    </header>

    <!-- Navegação -->
    <nav class="nav-bar">
        <ul class="nav-links">
            <li class="dropdown">
                <a href="#">Menu</a>
                <ul class="dropdown-content">
                    <li><a href="#">Cafés</a></li>
                    <li><a href="#">Bolos</a></li>
                    <li><a href="#">Doces</a></li>
                    <li><a href="#">Chás</a></li>
                </ul>
            </li>
            <li><a href="#">Sobre</a></li>
        </ul>
    </nav>
   
   
<body>
   

    <div class="form-container">
        <div class="form-section">
            <h2>Cadastro de Cliente</h2>
            <form action="cadastro.php" method="POST" id="cadastroForm">
                <div class="input-box">
                    <label for="name">Nome:</label>
                    <input type="text" id="name" name="name" required>

                    <label for="cpf">CPF:</label>
                    <input type="text" id="cpf" name="cpf" required>

                    <label for="telefone">Telefone:</label>
                    <input type="text" id="telefone" name="telefone" required>

                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>

                    <label for="nome_usuario">Nome de Usuário:</label>
                    <input type="text" id="nome_usuario" name="nome_usuario" required>

                    <label for="senha">Senha:</label>
                    <input type="password" id="senha" name="senha" required>
                </div>

                <div class="input-box">
                    <label for="rua">Rua:</label>
                    <input type="text" id="rua" name="rua" required>

                    <label for="numero">Número:</label>
                    <input type="text" id="numero" name="numero" required>

                    <label for="complemento">Complemento:</label>
                    <input type="text" id="complemento" name="complemento">

                    <label for="bairro">Bairro:</label>
                    <input type="text" id="bairro" name="bairro" required>

                    <label for="cidade">Cidade:</label>
                    <input type="text" id="cidade" name="cidade" required>

                    <label for="cep">CEP:</label>
                    <input type="text" id="cep" name="cep" required>
                </div>

                <button type="submit">Cadastrar</button>
            </form>
        </div>
    </div>

    <script src="script.js"></script> </body>
</html>
        </div>
    </div>
    

    <!-- Botão de Cadastro Centralizado -->
    <div class="submit-container">
        <button type="submit" name="submit" class="submit-btn">Cadastrar</button>
    </div>


    </body>
</html>
