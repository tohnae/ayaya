package com.example.ayaya;

import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class Author {

    @FXML
    private TextField idLog;

    @FXML
    private TextField idPass;

    @FXML
    private Button idVhod;
    DBUsers db = null;
    @FXML
    void initialize() {

        // Инициируем объект
        db = new DBUsers();

        // Обработчик события. Сработает при нажатии на кнопку
        idVhod.addEventHandler(MouseEvent.MOUSE_CLICKED, new EventHandler<MouseEvent>() {
            // Метод, что будет срабатывать
            @Override
            public void handle(MouseEvent mouseEvent) {
                try {
                    // Проверяем является ли поле заполненным
                    if(!idLog.getText().trim().equals("")&!idPass.getText().trim().equals("")) {
                        // Вызываем метод из класса DB
                        // через этот метод будет добавлено новое задание
                        int a=db.getUser(idLog.getText(),idPass.getText());
                        if (a==2)
                        {
                            FXMLLoader fxmlLoader = new FXMLLoader(HelloApplication.class.getResource("hello-view.fxml"));
                            Stage stage=new Stage();
                            Scene scene = new Scene(fxmlLoader.load(), 620, 540);
                            stage.setTitle("Просмотр списка студентов");
                            stage.setScene(scene);
                            stage.show();
                        }
                        if (a==1)
                        {
                            FXMLLoader fxmlLoader = new FXMLLoader(HelloApplication.class.getResource("cabin.fxml"));
                            Stage stage=new Stage();
                            Scene scene = new Scene(fxmlLoader.load(), 620, 540);
                            stage.setTitle("Личный кабинет");
                            stage.setScene(scene);
                            stage.show();
                        }
                        if(a==0) {System.out.println("Неверные данные");}
                    }
                } catch (SQLException e) { // Отслеживаем ошибки
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
        });

        // Метод для подгрузки заданий внутрь программы
    }

}