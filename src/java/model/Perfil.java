
package model;

//JAVA BEAN

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class Perfil {
    private int idPerfil;
    private String nome;
    private Date dataCadastro;
    private ArrayList<Menu> menus;
    
    public Perfil(){
        
    }

    public int getIdPerfil() {
        return idPerfil;
    }

    public void setIdPerfil(int idPerfil) {
        this.idPerfil = idPerfil;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Date getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(Date dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public ArrayList<Menu> getMenus() {
        return menus;
    }

    public void setMenus(ArrayList<Menu> menus) {
        this.menus = menus;
    }
    
    
    
    
    public boolean gravar()throws SQLException{
        PerfilDAO pdao = new PerfilDAO();
        return pdao.gravar(this);
    }
    
   
    
    
    
}
