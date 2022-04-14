/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author khait
 */
public class packages {
    private int id;
    private String name;
    private String accessDuration;
    private int status;
    private double price;
    private double salePrice;
    private String description;

    public packages() {
    }

    public packages(int id, String name, String accessDuration, int status, double price, double salePrice, String description) {
        this.id = id;
        this.name = name;
        this.accessDuration = accessDuration;
        this.status = status;
        this.price = price;
        this.salePrice = salePrice;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAccessDuration() {
        return accessDuration;
    }

    public void setAccessDuration(String accessDuration) {
        this.accessDuration = accessDuration;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(double salePrice) {
        this.salePrice = salePrice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "packages{" + "id=" + id + ", name=" + name + ", accessDuration=" + accessDuration + ", status=" + status + ", price=" + price + ", salePrice=" + salePrice + ", description=" + description + '}';
    }
    
}
