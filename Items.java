package org.mypackage.hello;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author dreamlord
 */
import java.io.*;
import java.util.*;
import java.text.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Items {
    


    public static String[] calc( Cookie[] cookies,String[] prices, String[] quantities, boolean submit, boolean reset) {
        
    float[] res = new float[7];
    float[] newcook = new float[3];                   //everything new* is used to convert from string to floats
    float[] newprices = new float[3];
    float[] newquantities = new float[3];
    String[] cook = new String[3];
    String[] names = new String[3];
    String[] finalres = new String[7];
    names[0] = "Cafe";
    names[1] = "Sugar";
    names[2] = "Water";
    int i,j;
      
        if (cookies != null) {    
            for (i=0; i<cookies.length; i++) {
               Cookie cookie = cookies[i];
               for (j=0; j<3; j++) {
                   if (cookie.getName().equals(names[j])) {
                       cook[j] = cookie.getValue();
                  }
                
                }
            
         }
        
            //convert to floats
         try {
                for (i=0; i<3; i++) {
                   if (cook[i]==null || cook[i].equals("")) {
                        newcook[i] = 0;
                   }
                  else {
                      newcook[i] = Float.valueOf(cook[i]);
                  }
              }
            }
            catch (NumberFormatException nfe) 
            {
               System.err.println("NumberFormatException: " + nfe.getMessage());
            }
        }
        else {
            reset = true;
        }
        
        
        try {
            for (i=0; i<3; i++) {
                if (prices[i].equals("")) {
                    newprices[i] = 0;
                }
                else {
                    newprices[i] = Float.valueOf(prices[i]);
                }
            }
        }
        catch (NumberFormatException nfe) 
        {
            System.err.println("NumberFormatException: " + nfe.getMessage());
        }
        
        try {
            for (i=0; i<3; i++) {
                if (quantities[i]==null || quantities[i].equals("")) {
                    newquantities[i] = 0;
                }
                else {
                    newquantities[i] = Float.valueOf(quantities[i]);
                }
            }
        }
        catch (NumberFormatException nfe) 
        {
            System.err.println("NumberFormatException: " + nfe.getMessage());
        }
     
        
        if (reset) {
            res[0]=0;
            res[1]=0;
            res[2]=0;
        }
        else if (submit) {
            res[0] = newquantities[0];
            res[1] = newquantities[1];
            res[2] = newquantities[2];    
        }
        else {
            res[0] = newcook[0];
            res[1] = newcook[1];
            res[2] = newcook[2];
        }
        //make the calculations
        res[3] = res[0]*newprices[0];
        res[4] = res[1]*newprices[1];
        res[5] = res[2]*newprices[2];
        res[6] = res[3]+res[4]+res[5];
        //convert and send as string

        
        for (i=0; i<7; i++) {
            finalres[i] = Float.toString(res[i]);
        }
        
        return (finalres);
        
    }
    

}
