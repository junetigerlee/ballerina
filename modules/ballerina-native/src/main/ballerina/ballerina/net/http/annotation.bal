package ballerina.net.http;

annotation GET attach resource {
}

annotation POST attach resource {
}

annotation PUT attach resource {
}

annotation DELETE attach resource {
}

annotation HEAD attach resource {
}

annotation Path attach resource {
    string value;
}

annotation BasePath attach service {
    string value;
}

annotation PathParam attach parameter {
    string value;
}

annotation QueryParam attach parameter {
    string value;
}