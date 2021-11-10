
package factory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConexaoFactory {
    private static final String URL = "jdbc:mysql://leolimabarbearia.mysql.database.azure.com:3306/barbearia?serverTimezone=UTC";
    private static final String USUARIO = "adminprojeto@leolimabarbearia";
    private static final String SENHA = "Projetofinal123";
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    
    public static Connection conectar() throws SQLException{
        try {
            Class.forName(DRIVER);
            Connection conexao = DriverManager.
                    getConnection(URL, USUARIO, SENHA);
            return conexao;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Falha ao registrar o driver: " +
                    e.getMessage());
            
        }
    }
    
    public static void close(Connection conexao) throws SQLException{
        if(conexao != null){
            conexao.close();
        }
        
    }
    
}
