
package model;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Vitor
 */
public class Agendamento {
    private int idAgendamento;
    private Date dataAgendamento;
    private double valor;
    private int status;
    private int idAtendente;
    private Usuario usuario;
    
    public Agendamento (){
        
    }

    public int getIdAgendamento() {
        return idAgendamento;
    }

    public void setIdAgendamento(int idAgendamento) {
        this.idAgendamento = idAgendamento;
    }

    public Date getDataAgendamento() {
        return dataAgendamento;
    }

    public void setDataAgendamento(Date dataAgendamento) {
        this.dataAgendamento = dataAgendamento;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getAtendente() {
        return this.idAtendente;
    }

    public void setAtendente(int atendente) {
        this.idAtendente = atendente;
    }

    

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    
           
}
