package schoolManagementSystem;
/*
* Created by Abraham on 2/6/2019
*This class is responsible for keeping the
*tack of students fees, name , grade & fee paid
 */
public class Student {
    private int id;
    private String name;
    private int grade;
    private int feesPaid;
    private int feesTotal;

    /**
     * to create a new student by initializing
     * fees for every student is $30,000
     * feesPaid initially is zero
     * @param id id for the studet , unique
     * @param name name of student
     * @param grade grade of student
     */
    public Student(int id,String name,int grade){
        feesPaid = 0;
        this.feesTotal = 30000;
        this.id = id;
        this.name = name;
        this.grade = grade;
    }
    //we are not going to alter students name,id

    /**
     * used to update student's grade
     * @param grade new grade for students
     */
    public void setGrade(int grade) {
        this.grade = grade;
    }

    /**
     * keep adding the fees to feesPaid field
     * fees paid = 10,000 + 5000 + 2500
     * add the fees to fees paid
     * the school is going to receive the fees
     * @param fees the fees that the student pays
     */
    public void updateFeesPaid(int fees){
        feesPaid+=fees;
    }

    /**
     *
     * @return id of student
     */
    public int getId() {
        return id;
    }

    /**
     *
     * @return name of student
     */
    public String getName() {
        return name;
    }

    /**
     *
     * @return grade of student
     */
    public int getGrade() {
        return grade;
    }

    /**
     *
     * @return fees paid by student
     */
    public int getFeesPaid() {
        return feesPaid;
    }

    /**
     *
     * @return total fees of student
     */
    public int getFeesTotal() {
        return feesTotal;
    }
}
