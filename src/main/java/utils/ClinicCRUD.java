package utils;

import entities.Clinic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClinicCRUD {
    public static List<Clinic> getClinicsData(String query) {
        List<Clinic> clinics = new ArrayList<>();

        try (Connection connection = DBUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)
        ) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Long id = resultSet.getLong("id");
                String name = resultSet.getString("name");
                String phone = resultSet.getString("phone");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");

                clinics.add(new Clinic(id, name, phone, email, address));
            }
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
        return clinics;
    }

    public static void saveClinic(Clinic clinic) {
        String INSERT_CLINIC = "INSERT INTO clinics.clinic(name, phone, email, address) VALUES (?, ?, ?, ?)";
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CLINIC)
        ) {
            preparedStatement.setString(1, clinic.getName());
            preparedStatement.setString(2, clinic.getPhone());
            preparedStatement.setString(3, clinic.getEmail());
            preparedStatement.setString(4, clinic.getAddress());
            preparedStatement.executeUpdate();
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

    public static void updateClinic(Long id, String address) {
        String UPDATE_CLINIC = "UPDATE clinics.clinic SET address = ? WHERE id = ?";
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CLINIC)
        ) {
            preparedStatement.setString(1, address);
            preparedStatement.setLong(2, id);
            preparedStatement.executeUpdate();
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

    public static void deleteClinic(Long id) {
        String DELETE_CLINIC = "DELETE FROM clinics.clinic WHERE id = ?";
        try (Connection connection = DBUtils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CLINIC)
        ) {
            preparedStatement.setLong(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

}
