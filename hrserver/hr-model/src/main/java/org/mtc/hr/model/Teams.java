package org.mtc.hr.model;

public class Teams {
    private String id;
    private String name;
    private String manager;
    private String analyst;
    private String designer;
    private String programmer;
    private String tester;

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

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager;
    }

    public String getAnalyst() {
        return analyst;
    }

    public void setAnalyst(String analyst) {
        this.analyst = analyst;
    }

    public String getDesigner() {
        return designer;
    }

    public void setDesigner(String designer) {
        this.designer = designer;
    }

    public String getProgrammer() {
        return programmer;
    }

    public void setProgrammer(String programmer) {
        this.programmer = programmer;
    }

    public String getTester() {
        return tester;
    }

    public void setTester(String tester) {
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
