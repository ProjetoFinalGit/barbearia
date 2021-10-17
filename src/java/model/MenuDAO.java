/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import factory.ConexaoFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Vitor
 */
public class MenuDAO {
    public ArrayList<Menu> getMenus() throws SQLException{
        ArrayList<Menu> listaMenu= new ArrayList();
       
        
        String sql="SELECT idMenu, nome, link,icone, exibir FROM menu";
        Connection conexao = ConexaoFactory.conectar();
        PreparedStatement ps=conexao.prepareStatement(sql);
        ResultSet lista= ps.executeQuery();
        
        while(lista.next()){
             Menu menu= new Menu();
            menu.setIdMenu(lista.getInt("idMenu"));
            menu.setNome(lista.getString("nome"));
            menu.setLink(lista.getString("link"));
            menu.setIcone(lista.getString("icone"));
            menu.setExibir(lista.getInt("exibir"));
            listaMenu.add(menu);
        }
        
        ConexaoFactory.close(conexao);
        return listaMenu;
    }
    
    public boolean gravar(Menu menu) throws SQLException{
        
        
        Connection conexao = ConexaoFactory.conectar();
        
        if(menu.getIdMenu()==0){
            String sql="INSERT INTO menu(nome, link, icone, exibir) VALUES (?,?,?,?)";
            PreparedStatement ps=conexao.prepareStatement(sql);
            ps.setString(1, menu.getNome());
            ps.setString(2, menu.getLink());
            ps.setString(3,menu.getIcone());
            ps.setInt(4, menu.getExibir());
            ps.execute();
            ConexaoFactory.close(conexao);
            return true;
        }else{
            String sql="UPDATE menu SET nome=?,link=?,icone=?,exibir=? WHERE idMenu=?";
            PreparedStatement ps=conexao.prepareStatement(sql);
            ps.setString(1, menu.getNome());
            ps.setString(2, menu.getLink());
            ps.setString(3,menu.getIcone());
            ps.setInt(4, menu.getExibir());
            ps.setInt(5, menu.getIdMenu());
            ps.execute();
            ConexaoFactory.close(conexao);
            return true;
        }
        
    }
    
    public boolean deletar(int idMenu) throws SQLException{
        Connection conexao = ConexaoFactory.conectar();
        String sql= "DELETE FROM menu WHERE idMenu=?";
        PreparedStatement ps= conexao.prepareStatement(sql);
        ps.setInt(1, idMenu);
        ps.execute();
        ConexaoFactory.close(conexao);
        return true;
    }
    
    public Menu getCarregarPorId(int idMenu) throws SQLException{
        Connection conexao = ConexaoFactory.conectar();
        String sql= "SELECT idMenu, nome, link,icone, exibir FROM menu WHERE idMenu=?";
        PreparedStatement ps= conexao.prepareStatement(sql);
        ps.setInt(1, idMenu);
        ResultSet menuListado= ps.executeQuery();
        Menu menu= new Menu();
        
        while(menuListado.next()){
            menu.setIdMenu(menuListado.getInt("idMenu"));
            menu.setNome(menuListado.getString("nome"));
            menu.setLink(menuListado.getString("link"));
            menu.setIcone(menuListado.getString("icone"));
            menu.setExibir(menuListado.getInt("exibir"));
            
        };
        
        ConexaoFactory.close(conexao);
        
        return menu;
    }
}
