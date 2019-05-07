/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.services;

import cl.model.Client;
import java.util.ArrayList;
import javax.ejb.Singleton;

/**
 *
 * @author sistemas
 */
@Singleton
public class Service implements ServiceLocal {
    
    private ArrayList<Client> list = new ArrayList();

    public Service() {
        list.add(new Client(1, "Jhon", "Smith"));
        list.add(new Client(2, "Sara", "Jonsson"));
    }
    
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    @Override
    public void addClient(Client client) {
        list.add(client);
    }

    @Override
    public Client search(int id) {
        for (Client c : list){
            if (c.getId() == id ) {
                return c;
            }
        }
        return null;
    }

    @Override
    public ArrayList<Client> getAllClient() {
        return list;
    }

    @Override
    public String deleteClient(int id) {
        Client c = search(id);
        if (c==null){
            return "Id not found.";
        }
        else {
            list.remove(c);
            return "Client Removed.";
        }
    }
    
    @Override
    public String updateClient(int id, String name, String lastName) {
        Client c = search(id);
        if (c==null){
            return "Id not found.";
        }
        else {
            c.setName(name);
            c.setLastName(lastName);
            return "Client Updated.";
        }
    }
    
    
}
