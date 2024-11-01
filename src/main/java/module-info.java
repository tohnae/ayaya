module com.example.ayaya {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;


    opens com.example.ayaya to javafx.fxml;
    exports com.example.ayaya;
}