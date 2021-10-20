/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author Vitor
 */
public class AgendamentoDAO {
    public boolean gravarAgendamento(Agendamento agendamento){
        return true;
    }
    
    public ArrayList<Agendamento> agendamentos(){
        ArrayList<Agendamento> agendamentos = new ArrayList<>();
        
        
        return agendamentos;
    }
    
    public boolean deletarAgendamento(int idAgendamento){
        
        return true;
    }
    
    public Agendamento carregarAgendamentoPorId(int idAgendamento){
        
        Agendamento agendamento= new Agendamento();
        return agendamento;
    }
}
