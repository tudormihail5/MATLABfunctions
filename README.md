# MATLAB image processing

### What they do:

**LoG:**<br />
It creates a mask to implement the Laplacian of Gaussian filter.<br />

**gaussian:**<br />
It generates a the horizontal and vertical first order Gaussian masks for edge detection or smoothing, being the first part of Canny edge detection.<br />

**nonMaxSuppression:**<br />
This function is the second part of Canny edge detection, suppressing the image to thin edges.<br />

**hysteresis:**<br />
This is the third and last part of Canny, which does the hysteresis thresholding and edge linking, applying edge tracking to connect and finalise the edges.<br />

**edges:**<br />
This is the first part of ROC analysis, used to measure how accurate the edge detectors are. It compares the binary edge map with the ground truth.<br />

**ROC:**<br />
This is the second and last part of ROC, which computes the amount of TPs, FNs, FPs, and TNs, before calculating the true positive and false positive rates.<br />

### How I built them:

- LoG creates two matrices using the ‘meshgrid’ function, making sure they are centred at (0,0) using the expression ‘-(kernel-1)/2:(kernel-1)/2’.
- Then, it creates the mask using its formula, and making use of the X, Y, and sigma.
<!-- -->
**Examples:**<br />
<!-- -->
![commands1](https://github.com/tudormihail5/MATLABfunctions/blob/main/LoGCommands.png)
<!-- -->
![edges1](https://github.com/tudormihail5/MATLABfunctions/blob/main/LoGEdges.png)
<!-- -->
- gaussian creates the Gaussian mask using the formula and the meshgrid, then calculates the derivatives with respect to X and Y.
<!-- -->
- nonMaxSuppression takes two arguments, the magnitude and the direction.
- The function checks the values of the gradient magnitude at each pixel, and if the value at the current pixel is
greater than or equal to both its neighbours, it is considered a local maximum and retained.
- The numerical values are chosen to divide a range of possible gradient directions into four quadrants of equal size, centred around the vertical, diagonal, and horizontal directions; the values correspond to angles in degrees, where 0 is the positive x-axis, and angles increase counterclockwise; in the code, for example, the first ‘if’ statement handles the case where the gradient direction is close to the horizontal direction; the last ‘if’ of the function checks whether the magnitude at (i, j) is greater than or equal to the maximum of its neighbours, and if it is, the value is copied to the output, which is initially a matrix of 0’s, with the same size as the input image.
<!-- -->
- hysteresis takes three arguments, the input image, and the two thresholds.
- After retrieving the numbers of rows and columns of the input image and initialising a matrix with zeros, it performs the thresholding on the input image.
- Each pixel is checked against the high and low thresholds, and if it is greater than or equal to the high threshold, it is set to ‘2’; if it is greater than or equal to the low threshold, it is set to ‘1’.
- All other pixels are set to ‘0’.
- Then, it initialises the output matrix with 0, and performs the edge linking.
- Each pixel set to ‘2’ is marked as an edge pixel; for each pixel that is ‘1’, its 8-neighbourhood is checked, and if any neighbour is edge, then the pixel itself is also masked as edge.
<!-- -->
**Examples:**<br />
<!-- -->
![commands2](https://github.com/tudormihail5/MATLABfunctions/blob/main/CannyCommands.png)
<!-- -->
![edges2](https://github.com/tudormihail5/MATLABfunctions/blob/main/CannyEdges.png)
<!-- -->
- edges returns ‘matches’, a binary image that indicates which pixels match in the two images, found using the logical ‘AND’ between them, ‘nonMatches’, the logical ‘AND’ between the edge map and the complement of the ground, and ‘types’, a matrix that indicates the type of match between each pixel.
- ‘types’ can take four possible values: 1 (true positives, pixel in the edge map is also in the ground truth), 2 (false negative, pixel in ground is not detected as an edge), 3 (false positive, pixel in edge map that is not an edge in ground), and 4 (true negative, pixel is not an edge in either of the images).
<!-- -->
- ROC uses ‘types’ created by the previous function, and computes the amount of true positives (TP), false negatives (FN), false positives (FP), and true negatives (TN).
- It then calculates the true positive rate (TPR = TP / (TP + FN)), and the false positive rate (FPR = FP / (FP + TN)) using the formulas.

### Challenges I ran into:

Canny was definitely the most difficult one, and it took a while and some research to understand all the steps and their purpose in creating a better edge detection.
