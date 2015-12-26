/*
javac -g A.java && java A
*/
class A {
        public A A() {
                A A = new A();
                return A;
        }

        public static void main(String[] args) {
                A A = new A();
                A.A();
        }
}