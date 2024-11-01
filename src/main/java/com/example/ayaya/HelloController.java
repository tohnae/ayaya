package com.example.ayaya;

import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.VBox;
import javafx.util.Callback;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HelloController {


    @FXML
    private Button idadd;

    @FXML
    private TextField idfam;

    @FXML
    private ListView<String> idspis;

    DB db = null;
    @FXML
    void initialize() {

        // Инициируем объект
        db = new DB();

        // Обработчик события. Сработает при нажатии на кнопку
        idadd.addEventHandler(MouseEvent.MOUSE_CLICKED, new EventHandler<MouseEvent>() {
            // Метод, что будет срабатывать
            @Override
            public void handle(MouseEvent mouseEvent) {
                try {
                    // Проверяем является ли поле заполненным
                    if(!idfam.getText().trim().equals("")) {
                        // Вызываем метод из класса DB
                        // через этот метод будет добавлено новое задание
                        db.insertStudent(idfam.getText());
                        // loadInfo(); // Метод для подгрузки заданий внутрь программы
                        idfam.setText(""); // Очищаем поле
                        loadInfo();
                    }
                } catch (SQLException e) { // Отслеживаем ошибки
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
        });

        // Метод для подгрузки заданий внутрь программы
        loadInfo();
    }
    void loadInfo() {
        try {
            // Сначала очищаем от прошлых значений
            // idspis.getChildren().clear();

            // Получаем все задания из базы данных
            //ArrayList<String> stud = db.getStudent();
            List<String> ls=db.getStudent();
            //  for (int i = 0; i < stud.size(); i++) // Перебираем их через цикл
            // Добавляем каждое задание в объект VBox (all_tasks)
            idspis.getItems().addAll(ls);
            idspis.setCellFactory(stringListView -> {
                ListCell<String> cell = new ListCell<>();
                ContextMenu contextMenu = new ContextMenu();
                MenuItem editItem = new MenuItem("Добавить");
                editItem.setOnAction(event -> {
                    String item = cell.getItem();
                    try {
                        System.out.println(db.getStudent(item));
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    } catch (ClassNotFoundException e) {
                        throw new RuntimeException(e);
                    }
                    // code to edit item...
                });
                contextMenu.getItems().addAll(editItem);
                cell.textProperty().bind(cell.itemProperty());
                cell.emptyProperty().addListener((obs, wasEmpty, isNowEmpty) -> {
                    if (isNowEmpty) {
                        cell.setContextMenu(null);
                    } else {
                        cell.setContextMenu(contextMenu);
                    }
                });
                return cell;
            });
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}