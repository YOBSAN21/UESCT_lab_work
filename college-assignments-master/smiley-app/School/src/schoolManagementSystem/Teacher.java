package schoolManagementSystem;

/**
 * created by Abraham on 2/6/2019
 * This class is responsible for keeping the track
 * of teachers name , id , salary
 */
public class Teacher {
    private  int id;
    private String name;
    private int salary;

    /**
     * creates a new teacher object
     * @param id id for the teacher
     * @param name name for the teacher
     * @param salary salary for the teacher
     */
    public Teacher(int id, String name, int salary){
        this.id = id;
        this.name = name;
        this.salary = salary;
    }

    /**
     *
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     *
     * @return name of the teacher
     */
    public String getName(){
       return  name;
    }

    /**
     *
     * @return salary of the teacher
     */
    public int getSalary() {
        return salary;
    }
    /**
     * set salary of the teacher
     * @param salary
     */
    public void setSalary(int salary) {
        this.salary = salary;
    }
}
