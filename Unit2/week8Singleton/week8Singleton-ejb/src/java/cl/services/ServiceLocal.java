/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.services;

import cl.model.Client;
import java.util.ArrayList;
import javax.ejb.Local;

/**
 *
 * @author sistemas
 */
@Local
public interface ServiceLocal {

    void addClient(Client client);

    Client search(int id);
    
    ArrayList<Client> getAllClient();

    String deleteClient(int id);
    
}
