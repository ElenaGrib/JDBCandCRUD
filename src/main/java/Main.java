import entities.Clinic;
import utils.ClinicCRUD;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        System.out.println("Initial list of Clinics:");
        List<Clinic> clinics1 = ClinicCRUD.getClinicsData("SELECT * FROM clinics.clinic");
        System.out.println(clinics1);


        Clinic clinic = new Clinic();
        clinic.setName("Медилюкс Могилев");
        clinic.setPhone("+375-29-235-43-11");
        clinic.setEmail("mlmogilev@medilus.by");
        clinic.setAddress("Беларусь, Могилев, Гагарина, 11");

        ClinicCRUD.saveClinic(clinic);

        List<Clinic> clinics2 = ClinicCRUD.getClinicsData("SELECT * FROM clinics.clinic");

        System.out.println("\nAfter adding new one:");
        System.out.println(clinics2);


        ClinicCRUD.updateClinic(6L, "Беларусь, Могилев, Гагарина, 11 НОВЫЙ");

        List<Clinic> clinics3 = ClinicCRUD.getClinicsData("SELECT * FROM clinics.clinic");

        System.out.println("\nAfter updating by id:");
        System.out.println(clinics3);


        ClinicCRUD.deleteClinic(4L);

        List<Clinic> clinics4 = ClinicCRUD.getClinicsData("SELECT * FROM clinics.clinic");

        System.out.println("\nAfter removing by id:");
        System.out.println(clinics4);


    }
}
