<html lang="en">

<head>
    <meta charset="UTF-8">
    </meta>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <h1>
        <?php
        echo "hello world!";
        ?>
    </h1>
    <h2>
        <?php
        $nome = "otavio";
        $nascimento = 2005;
        $hoje = date("Y");
        $idade = $hoje - $nascimento;
        
        echo "$nome, tem $idade anos ";
        ?>
    </h2>
</body>

</html>