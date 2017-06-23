import ballerina.lang.system;
import ballerina.lang.datatables;
import ballerina.data.sql;

@doc:Description{value : "This is the struct corresponding to the result set. The field names of the struct should match column names of the table. The field types are the matching ballerina type for the given sql type "}
struct Result {
    int id;
    string name;
    float salary;
    boolean status;
    string birthdate;
    string birthtime;
    string updated;
}

function main (string[] args) {
    //Create a SQL connector by providing the required database connection
    //pool properties.
    map properties = {"jdbcUrl":"jdbc:mysql://localhost:3306/db",
                      "username":"root", "password":"root"};
    sql:ClientConnector testDB = create sql:ClientConnector(properties);

    //Query the table using SQL connector select action.Either select or call
    //action can return a datatable.
    sql:Parameter[] parameters = [];
    datatable dt = sql:ClientConnector.select(testDB,
                  "SELECT * from employees", parameters);

    //Iterate through the result set until hasNext become false and retrieve
    //the data struct corresponding to each row.
    while (datatables:hasNext(dt)) {
        any dataStruct = datatables:next(dt);
        var rs, err = (Result)dataStruct;
        //Access data from struct and print the values.
        system:println("Employese:" + rs.id + "|" + rs.name + 
			"|" + rs.salary + "|" + rs.status + 
			"|" + rs.birthdate + 
			"|" + rs.birthtime + 
			"|" +  rs.updated);
    }

    //Close the datatable and database.
    datatables:close(dt);
    sql:ClientConnector.close(testDB);
}
