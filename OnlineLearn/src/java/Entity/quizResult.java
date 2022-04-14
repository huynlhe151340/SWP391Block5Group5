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
public class quizResult {
    
    private int id;
    private int accountID;
    private int quizID;
    private double result;
    private int status;

    public quizResult() {
    }

    public quizResult(int id, int accountID, int quizID, double result, int status) {
        this.id = id;
        this.accountID = accountID;
        this.quizID = quizID;
        this.result = result;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public int getQuizID() {
        return quizID;
    }

    public void setQuizID(int quizID) {
        this.quizID = quizID;
    }

    public double getResult() {
        return result;
    }

    public void setResult(double result) {
        this.result = result;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "quizResult{" + "id=" + id + ", accountID=" + accountID + ", quizID=" + quizID + ", result=" + result + ", status=" + status + '}';
    }
    
}
