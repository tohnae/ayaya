module com.example.ayaya {
    requires javafx.controls;
    requires javafx.fxml;


    opens com.example.ayaya to javafx.fxml;
    exports com.example.ayaya;
}