package com.example.demo_student.model;

public class Student {
    private String stuID;
    private String name;
    private String dorAddress;
    private double score;

    public Student() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDorAddress() {
        return dorAddress;
    }

    public void setDorAddress(String dorAddress) {
        this.dorAddress = dorAddress;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public String getStuID() {
        return stuID;
    }

    public void setStuID(String stuID) {
        this.stuID = stuID;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((dorAddress == null) ? 0 : dorAddress.hashCode());
        result = prime * result + ((stuID == null) ? 0 : stuID.hashCode());
        result = prime * result + ((name == null) ? 0 : name.hashCode());
        long temp;
        temp = Double.doubleToLongBits(score);
        result = prime * result + (int) (temp ^ (temp >>> 32));
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Student other = (Student) obj;
        if (dorAddress == null) {
            if (other.dorAddress != null)
                return false;
        } else if (!dorAddress.equals(other.dorAddress))
            return false;
        if (stuID == null) {
            if (other.stuID != null)
                return false;
        } else if (!stuID.equals(other.stuID))
            return false;
        if (name == null) {
            if (other.name != null)
                return false;
        } else if (!name.equals(other.name))
            return false;
        if (Double.doubleToLongBits(score) != Double.doubleToLongBits(other.score))
            return false;
        return true;
    }

}
