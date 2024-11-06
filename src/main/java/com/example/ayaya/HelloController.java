package com.example.ayaya;

import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.geometry.Orientation;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.util.Callback;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HelloController {

    @FXML
    private Label signUser;

    @FXML
    private Button idadd;

    @FXML
    private TextField idfam;

    @FXML
    private ListView<String> idspis;

    @FXML
    private TableView<Request> tableReq;

    @FXML
    private TableColumn<Request, Integer> requestIDColumn;
    @FXML
    private TableColumn<Request, String> startDateColumn;
    @FXML
    private TableColumn<Request, String> homeTechTypeColumn;
    @FXML
    private TableColumn<Request, String> homeTechModelColumn;
    @FXML
    private TableColumn<Request, String> problemDescryptionColumn;
    @FXML
    private TableColumn<Request, String> requestStatusColumn;
    @FXML
    private TableColumn<Request, String> completionDateColumn;
    @FXML
    private TableColumn<Request, String> repairPartsColumn;
    @FXML
    private TableColumn<Request, Integer> masterIDColumn;
    @FXML
    private TableColumn<Request, Integer> clientIDColumn;

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

        initData();

        // устанавливаем тип и значение которое должно хранится в колонке
        // столбец для вывода id
        requestIDColumn.setCellValueFactory(new PropertyValueFactory<Request, Integer>("requestID"));
        // столбец для вывода начала заявки
        startDateColumn.setCellValueFactory(new PropertyValueFactory<Request, String>("startDate"));
        // столбец для вывода типа техники
        homeTechTypeColumn.setCellValueFactory(new PropertyValueFactory<Request, String>("homeTechType"));
        // столбец для вывода модели техники
        homeTechModelColumn.setCellValueFactory(new PropertyValueFactory<Request, String>("homeTechModel"));
        // столбец для вывода описания проблемы
        problemDescryptionColumn.setCellValueFactory(new PropertyValueFactory<Request, String>("problemDescryption"));
        // столбец для вывода статуса
        requestStatusColumn.setCellValueFactory(new PropertyValueFactory<Request, String>("requestStatus"));
        // столбец для вывода даты завершения заявки
        completionDateColumn.setCellValueFactory(new PropertyValueFactory<Request, String>("completionDate"));
        // столбец для вывода запчастей
        repairPartsColumn.setCellValueFactory(new PropertyValueFactory<Request, String>("repairParts"));
        // столбец для вывода мастера
        masterIDColumn.setCellValueFactory(new PropertyValueFactory<Request, Integer>("masterID"));
        // столбец для вывода клиента
        clientIDColumn.setCellValueFactory(new PropertyValueFactory<Request, Integer>("clientID"));

        // заполняем таблицу данными
        tableReq.setItems(reqData);

    }
    void loadInfo() {
        try {
            // Сначала очищаем от прошлых значений
            // idspis.getChildren().clear();

            // Получаем все задания из базы данных
            //ArrayList<String> stud = db.getStudent();
            List<String> ls=db.getRequest();
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

    private ObservableList<Request> reqData = FXCollections.observableArrayList();


    private void initData() {
        reqData.add(new Request(1, "2023-06-06", "Фен", "Ладомир ТА112 белый", "Перестал работать", "В процессе ремонта", "null", " ", 2, 7));
        reqData.add(new Request(2, "2023-05-05", "Тостер", "Redmond RT-437 черный", "Перестал работать", "В процессе ремонта", "null", " ", 3, 7));
        reqData.add(new Request(3, "2022-07-07", "Холодильник", "Indesit DS 316 W белый", "Не морозит одна из камер холодильника", "Готова к выдаче", "2023-01-01", " ", 2, 8));

    }

}
