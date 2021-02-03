package org.mtc.hr.model;

public class Teams {
    private String id;
    private String name;
    private int manager;
    private int analyst;
    private int designer;
    private int programmer;
    private int tester;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getManager() {
        return manager;
    }

    public void setManager(int manager) {
        this.manager = manager;
    }

    public int getAnalyst() {
        return analyst;
    }

    public void setAnalyst(int analyst) {
        this.analyst = analyst;
    }

    public int getDesigner() {
        return designer;
    }

    public void setDesigner(int designer) {
        this.designer = designer;
    }

    public int getProgrammer() {
        return programmer;
    }

    public void setProgrammer(int programmer) {
        this.programmer = programmer;
    }

    public int getTester() {
        return tester;
    }

    public void setTester(int tester) {
        this.tester = tester;
    }

    @Override
    public String toString() {
        return "Teams{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", manager=" + manager +
                ", analyst=" + analyst +
                ", designer=" + designer +
                ", programmer=" + programmer +
                ", tester=" + tester +
                '}';
    }
}
