
package model;

import factory.ConexaoFactory;
import java.sql.Connection;
import java.sql.Date;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class UsuarioDAO {
    
    PerfilDAO pdao= new PerfilDAO();
  
    public ArrayList<Usuario> getLista() throws SQLException{
        ArrayList<Usuario> usuarios = new ArrayList();
        Connection conexao = ConexaoFactory.conectar();
        String sql="SELECT p.idPerfil,p.nome,u.idUsuario,u.nome,u.login,u.senha,u.status,u.idPerfil FROM perfil p INNER JOIN usuario u ON p.idPerfil=u.idPerfil";
        
        PreparedStatement query= conexao.prepareStatement(sql);
        ResultSet lista= query.executeQuery();
        
        
        while(lista.next()){
            
            Perfil perfil = new Perfil();
            Usuario usuario = new Usuario();
            usuario.setIdUsuario(lista.getInt("u.idUsuario"));
            usuario.setNome(lista.getString("u.nome"));
            usuario.setLogin(lista.getString("u.login"));
            usuario.setSenha(lista.getString("u.senha"));
            usuario.setStatus(lista.getInt("u.status"));
            
            perfil.setIdPerfil(lista.getInt("p.idPerfil"));
            perfil.setNome(lista.getString("p.nome"));
            usuario.setPerfil(perfil);
            usuarios.add(usuario);
        }
        
        ConexaoFactory.close(conexao);
        return usuarios;
    }
    
    public boolean gravar(Usuario usuario) throws SQLException{
        Connection conexao = ConexaoFactory.conectar();
         
        
        if(usuario.getIdUsuario()==0){
            String sql="INSERT INTO usuario(nome, login, senha, status, idPerfil) VALUES (?,?,?,?,?)";
            PreparedStatement ps=conexao.prepareStatement(sql);
            ps.setString(1, usuario.getNome());
            ps.setString(2, usuario.getLogin());
            ps.setString(3,usuario.getSenha());
            ps.setInt(4, usuario.getStatus());
            ps.setInt(5, usuario.getPerfil().getIdPerfil());
            
            ps.execute();
            
            
        }if(usuario.getIdUsuario()>0){
            String sql="UPDATE usuario SET nome = ?, senha = ?, " +
                     "status = ?, idPerfil = ? WHERE idUsuario = ?";
            PreparedStatement ps=conexao.prepareStatement(sql);
            ps.setString(1, usuario.getNome());
            ps.setString(2, usuario.getLogin());   
            ps.setInt(3, usuario.getStatus());
            ps.setInt(4, usuario.getPerfil().getIdPerfil());
            ps.setDate(5, (Date) usuario.getDataNascimento());
            ps.setString(6, usuario.getEndereco());
            ps.setString(7, usuario.getTelefone());
            ps.setInt(8, usuario.getIdUsuario());
            
            
            ps.execute();
          
            
        }
        return true;
    }
    
    public boolean deletar(int idUsuario) throws SQLException{
        Connection conexao = ConexaoFactory.conectar();
        String sql="DELETE FROM usuario WHERE idUsuario=?";
        PreparedStatement ps=conexao.prepareStatement(sql);
        ps.setInt(1, idUsuario);
        ps.execute();
        ConexaoFactory.close(conexao);
        return true;
    }
    
    public Usuario getCarregarPorId(int id) throws SQLException{
        Usuario usuario = new Usuario();
        Perfil perfil= new Perfil();
        Connection conexao= ConexaoFactory.conectar();
        String sql="SELECT p.idPerfil,p.nome,u.idUsuario,u.nome,u.login,u.senha,u.status,u.idPerfil FROM perfil p INNER JOIN usuario u ON p.idPerfil=u.idPerfil WHERE u.idUsuario=?";
        PreparedStatement ps = conexao.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet lista= ps.executeQuery();
        
        while(lista.next()){
            usuario.setIdUsuario(lista.getInt("idUsuario"));
            usuario.setNome(lista.getString("u.nome"));
            usuario.setLogin(lista.getString("u.login"));
            usuario.setSenha(lista.getString("u.senha"));
            usuario.setStatus(lista.getInt("u.status"));
            usuario.setCpf(lista.getString("u.cpf"));
            usuario.setDataNascimento(lista.getDate("u.dataNascimento"));
            usuario.setEndereco(lista.getString("u.endereco"));
            usuario.setTelefone(lista.getString("u.telefone"));
            perfil.setIdPerfil(lista.getInt("p.idPerfil"));
            perfil.setNome(lista.getString("p.nome"));
            usuario.setPerfil(perfil);
     
            
        }
        
        ConexaoFactory.close(conexao);
        return usuario;
    }
    
    public Usuario getCarregarUsuario(String login,String senha) throws SQLException{
       Usuario usuario = new Usuario();
       Perfil perfil= new Perfil();
        String sql="SELECT p.idPerfil,p.nome,u.idUsuario,u.nome,u.login,u.senha,u.status,u.idPerfil FROM perfil p INNER JOIN usuario u ON p.idPerfil=u.idPerfil WHERE u.login=? AND u.senha=?";
       
       Connection conexao= ConexaoFactory.conectar();
       PreparedStatement ps= conexao.prepareStatement(sql);
       ps.setString(1, login);
       ps.setString(2, senha);
       ResultSet rs= ps.executeQuery();
       
       if(rs.next()){
           usuario.setIdUsuario(rs.getInt("u.idUsuario"));
           usuario.setNome(rs.getString("u.nome"));
           usuario.setLogin(rs.getString("u.login"));
            usuario.setSenha(rs.getString("u.senha"));
            usuario.setStatus(rs.getInt("u.status"));
            
            usuario.setPerfil(pdao.getCarregarPorId(rs.getInt("p.idPerfil")));
       }
       conexao.close();
       return usuario;
    }
    
    public boolean getVerificarUsuario(String login, String cpf) throws SQLException{
        
        Usuario usuario = new Usuario();
        String sql= "SELECT idUsuario, login FROM usuario WHERE login=? ";
        Connection conexao= ConexaoFactory.conectar();
        PreparedStatement enviar = conexao.prepareStatement(sql);
        enviar.setString(1, login);
        ResultSet lista= enviar.executeQuery();
        
        
        String sql2="SELECT idUsuario, login FROM usuario WHERE cpf=?";
        PreparedStatement enviar2= conexao.prepareStatement(sql2);
        enviar2.setString(1, cpf);
        ResultSet lista2= enviar2.executeQuery();
        
        if(lista.next() || lista2.next()){
            ConexaoFactory.close(conexao);
            return true;
        }else{
            ConexaoFactory.close(conexao);
            return false;
            
        }
        
       
        
        
    }
}
