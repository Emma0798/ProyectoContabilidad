<?php
// Conectar a la base de datos (reemplaza con tus propias credenciales)
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "contabilidad";

$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Establecer el encabezado para indicar que la respuesta es JSON
header('Content-Type: application/json');

// Manejar solicitudes GET y POST
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    // Obtener parámetros de la solicitud GET
    $fecha = isset($_GET['fecha']) ? $_GET['fecha'] : null;
    $nroAsiento = isset($_GET['nroAsiento']) ? $_GET['nroAsiento'] : null;

    // Construir la consulta SQL
    $sql = "SELECT ld.nroAsiento, pdc.descripcion, ld.debe, ld.haber
            FROM libro_diario ld
            JOIN plan_de_cuentas pdc ON ld.FK_plan_de_cuentas = pdc.nroCuenta
            WHERE fecha = '$fecha'";

    if ($nroAsiento !== null) {
        $sql .= " AND nroAsiento = $nroAsiento";
    }

    $result = $conn->query($sql);

    // Crear un array para almacenar los resultados
    $data = array();

    // Obtener los datos de la consulta
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }

    // Establecer el encabezado JSON antes de imprimir la respuesta
    header('Content-Type: application/json');

    // Devolver los datos como JSON
    echo json_encode($data);
} elseif ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Manejar la solicitud POST
    // Decodificar los datos JSON enviados en la solicitud POST
    $postData = json_decode(file_get_contents("php://input"), true);

    // Procesar los datos según tus necesidades
    // Por ejemplo, puedes realizar una inserción en la base de datos
    // No llenes con nada por ahora
    echo json_encode(array('message' => 'Solicitud POST recibida'));

} else {
    // Manejar otros tipos de solicitudes si es necesario
    http_response_code(405); // Método no permitido
}

// Cerrar la conexión
$conn->close();
?>
