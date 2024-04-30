#include <iostream>
using namespace std;

// Function to perform binary addition
void add(int ac[], int x[], int qrn) {
    int i, c = 0;
    for (i = 0; i < qrn; i++) {
        ac[i] = ac[i] + x[i] + c;
        if (ac[i] > 1) {
            ac[i] = ac[i] % 2;
            c = 1;
        } else
            c = 0;
    }
}

// Function to find the two's complement of a binary number
void complement(int a[], int n) {
    int i;
    int x[8] = {0};
    x[0] = 1;
    for (i = 0; i < n; i++) {
        a[i] = (a[i] + 1) % 2;
    }
    add(a, x, n);
}

// Function to perform arithmetic shift right
void ashr(int ac[], int qr[], int &qn, int qrn) {
    int temp, i;
    temp = ac[0];
    qn = qr[0];
    cout << "\t\tashr\t\t";
    for (i = 0; i < qrn - 1; i++) {
        ac[i] = ac[i + 1];
        qr[i] = qr[i + 1];
    }
    qr[qrn - 1] = temp;
}

// Function to display the accumulator and multiplier
void display(int ac[], int qr[], int qrn) {
    int i;
    for (i = qrn - 1; i >= 0; i--)
        cout << ac[i];
    cout << " ";
    for (i = qrn - 1; i >= 0; i--)
        cout << qr[i];
}

int main() {
    int mt[10], br[10], qr[10], sc, ac[10] = {0};
    int brn, qrn, i, qn, temp;

    // User input for multiplicand
    cout << "\n--Enter the multiplicand and multiplier in signed 2's complement form if negative--";
    cout << "\nNumber of multiplicand bits: ";
    cin >> brn;
    cout << "Multiplicand: ";
    for (i = brn - 1; i >= 0; i--)
        cin >> br[i];

    // Copy multiplicand to temp array mt[]
    for (i = brn - 1; i >= 0; i--)
        mt[i] = br[i];

    // Find 2's complement of the multiplicand
    complement(mt, brn);

    // User input for multiplier
    cout << "Number of multiplier bits: ";
    cin >> qrn;
    cout << "Multiplier: ";
    for (i = qrn - 1; i >= 0; i--)
        cin >> qr[i];

    // Initialize sequence counter
    sc = qrn;

    // Initialize qn and temp
    qn = 0;
    temp = 0;

    // Display header for the multiplication process
    cout << "qn\tq[n+1]\t\tBR\t\tAC\tQR\tsc\n";
    cout << "\t\tinitial\t\t";
    display(ac, qr, qrn);
    cout << "\t" << sc << "\n";

    // Perform Booth's algorithm steps
    while (sc != 0) {
        cout << qr[0] << "\t" << qn;
        if ((qn + qr[0]) == 1) {
            if (temp == 0) {
                // Add multiplicand to accumulator
                add(ac, mt, qrn);
                cout << "\t\tsubtracting BR\t";
                for (i = qrn - 1; i >= 0; i--)
                    cout << ac[i];
                temp = 1;
            } else if (temp == 1) {
                // Add multiplicand to accumulator
                add(ac, br, qrn);
                cout << "\t\tadding BR\t";
                for (i = qrn - 1; i >= 0; i--)
                    cout << ac[i];
                temp = 0;
            }
            cout << "\n\t";
            // Arithmetic shift right
            ashr(ac, qr, qn, qrn);
        } else if (qn - qr[0] == 0)
            // Arithmetic shift right
            ashr(ac, qr, qn, qrn);
        // Display accumulator and multiplier
        display(ac, qr, qrn);
        cout << "\t";
        // Decrement sequence counter
        sc--;
        cout << "\t" << sc << "\n";
    }
    // Display result
    cout << "Result=";
    display(ac, qr, qrn);
    cout << endl;

    return 0;
}
