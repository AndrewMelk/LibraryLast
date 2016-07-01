import java.util.ArrayList;
import java.util.List;

/**
 * Created by andrew on 08.06.16.
 */
public class Main {

    public static void main(String[] args){
        List<String> marks = new ArrayList<String>();
        String[] marksArray = {"AC Cars", "Acura", "Alfa Romeo", "Alpina", "Asia Motors", "Aston Martin", "Audi", "Bentley", "BIOAUTO", "BMW", "Brilliance", "Bugatti", "Buick", "BYD", "Cadillac", "Changfeng", "Changhe", "Chery", "Chevrolet", "Chrysler", "Citroen", "Dacia", "Dadi", "Daewoo", "Daihatsu", "Derways", "Dodge", "FAW", "Ferrari", "FIAT", "Ford", "Geely", "Great Wall", "Hafei Motor", "Honda", "Hummer", "Hyundai", "Infiniti", "Iran Khodro", "Isuzu", "JAC", "Jaguar", "Jeep", "Kia", "Lamborghini", "Lancia", "Land Rover", "Lexus", "Lifan", "Maserati", "Maybach", "Mazda", "Mercedes-Benz", "MG", "MINI", "Mitsubishi", "Nissan", "Opel", "Peugeot", "Porsche", "Renault", "Rolls-Royce", "Rover", "Saab", "SEAT", "Skoda", "Smart", "SsangYong", "Subaru", "Suzuki", "Tata", "Toyota", "Volkswagen", "Volvo", "Богдан", "ВАЗ", "ГАЗ", "ЗАЗ", "ИЖ", "ТагАЗ", "УАЗ"};
        String[] modelsArray = {"100", "200", "50", "80", "90", "A2", "A3", "A4", "A4 Allroad", "A5", "A6", "A6 Allroad", "A8", "Cabriolet", "Coupe", "NSU RO 80", "Q5", "Q7", "Quattro", "R8", "Rosemeyer", "RS4", "RS6", "S2", "S3", "S4", "S6", "S8", "TT", "TTS", "V8"};

                    for (int i = 0;i<modelsArray.length;i++){
                        String tmp = "insert into models (mark_name, model_name) value(" + "'"+ "Audi" + "'"+ ",'"+modelsArray[i]+ "'" + ");";
                        marks.add(tmp);
                        System.out.println(tmp);
                    }







    }
}
