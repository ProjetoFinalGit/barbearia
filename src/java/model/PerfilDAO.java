
package model;

import factory.ConexaoFactory;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class PerfilDAO {
    
    
    public ArrayList<Perfil> getLista(){
        String sql = "SELECT idPerfil, nome,dataCadastro FROM perfil";
        ArrayList<Perfil> perfis = new ArrayList<>();
        try {
           Connection con = ConexaoFactory.conectar();
           PreparedStatement ps = con.prepareStatement(sql);
           ResultSet rs = ps.executeQuery();
           while(rs.next()){
               Perfil p = new Perfil();
               p.setIdPerfil(rs.getInt("idPerfil"));
               p.setNome(rs.getString("nome"));
               p.setDataCadastro(rs.getDate("dataCadastro"));
               perfis.add(p);
           }
            ConexaoFactory.close(con);
            
        } catch (SQLException e) {
            System.out.println(
                    "Falha ao listar os perfis da base de dados:" +
                    e.getMessage());
        }
        return perfis;
    }
    
    public boolean gravar(Perfil p) throws SQLException{
        Connection con = null;
        String sql;
        PreparedStatement ps = null;
      
      
           con = ConexaoFactory.conectar();
           if(p.getIdPerfil() == 0){
               sql = "INSERT INTO perfil (nome,dataCadastro) VALUES (?,?)";
               ps = con.prepareStatement(sql);
               ps.setString(1, p.getNome());
               ps.setDate(2, new Date (p.getDataCadastro().getTime()));
                       
           }else{
               sql = "UPDATE perfil set nome = ?,dataCadastro=? WHERE idPerfil = ?";
               ps = con.prepareStatement(sql);
               ps.setString(1, p.getNome());
               ps.setDate(2, new Date (p.getDataCadastro().getTime()));
               ps.setInt(3, p.getIdPerfil());
           }
           ps.executeUpdate();
           ConexaoFactory.close(con);
           return true;
         
       
        
    }
    
    public boolean deletar(int idPerfil){
        String sql= "DELETE FROM perfil WHERE idPerfil = ?";
        try {
            Connection con = ConexaoFactory.conectar();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idPerfil);
            ps.executeUpdate();
            ConexaoFactory.close(con);
        } catch (SQLException e) {
            System.out.println("Falha ao excluir o perfil da base de dados" +
                    e.getMessage());
            return false;
        }
        return true;
    }
    
 
    
    public Perfil getCarregarPorId(int id)throws SQLException{
        Perfil perfil = new Perfil();
        String sql = "SELECT idPerfil, nome,dataCadastro FROM perfil WHERE idPerfil = ?";
        try {
            Connection con = ConexaoFactory.conectar();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                perfil.setIdPerfil(rs.getInt("idPerfil"));
                perfil.setNome(rs.getString("nome"));
                perfil.setDataCadastro(rs.getDate("dataCadastro"));
                perfil.setMenus(menusVinculadosPorPerfil(id));
            }
            ConexaoFactory.close(con);
           
        } catch (SQLException e) {
            System.out.println("Falha ao listar o perfil: " +
                    e.getMessage());
        }
        return perfil;
    }
    
    public ArrayList<Menu> menusVinculadosPorPerfil(int idPerfil){
        ArrayList<Menu>menus= new ArrayList();
        String sql="SELECT m.idMenu, m.nome, m.link, " + 
                    "m.icone, m.exibir " +
                    "FROM menu_perfil as mp, menu as m " +
                    "WHERE mp.idMenu = m.idMenu " +
                    "AND mp.idPerfil = ?";
        try {
            Connection con = ConexaoFactory.conectar();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idPerfil);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
               Menu menu = new Menu();
               menu.setIdMenu(rs.getInt("idMenu"));
               menu.setNome(rs.getString("nome"));
               menu.setLink(rs.getString("link"));
               menu.setIcone(rs.getString("icone"));
               menu.setExibir(rs.getInt("exibir"));
               menus.add(menu);
            }
            ConexaoFactory.close(con);
           
        } catch (SQLException e) {
            System.out.println("Falha ao listar os menus vinculados: " +
                    e.getMessage());
        }
        
        return menus;
    }
    
    public boolean vincular(int idMenu, int idPerfil) throws SQLException{
        String sql="INSERT INTO menu_perfil(idMenu,IdPerfil) values (?,?) ";
        Connection conexao = ConexaoFactory.conectar();
        PreparedStatement ps = conexao.prepareStatement(sql);
        ps.setInt(1, idMenu);
        ps.setInt(2, idPerfil);
        ps.execute();
        conexao.close();
        
        return true;
    }
    
    public boolean desvincular(int idMenu,int idPerfil) throws SQLException{
        String sql= "DELETE FROM menu_perfil WHERE idMenu=? AND idPerfil=?";
        Connection conexao = ConexaoFactory.conectar();
        PreparedStatement ps = conexao.prepareStatement(sql);
        ps.setInt(1, idMenu);
        ps.setInt(2, idPerfil);
        ps.execute();
        conexao.close();
        return true;
    }
    
    
}
