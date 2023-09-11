# MATLAB image processing

### What they do:

**LoG:**<br />
It creates a mask to implement the Laplacian of Gaussian filter.<br />

**gaussian:**<br />
It generates a the horizontal and vertical first order Gaussian masks for edge detection or smoothing, being the first part of Canny edge detection.<br />

**nonMaxSuppression:**<br />
This function is the second part of Canny edge detection, suppressing the image to thin edges.<br />

**hysteresis:**<br />
This is the third and last part of Canny, which does the hysteresis thresholding, applying edge tracking to connect and finalise the edges.<br />

**edges:**<br />
This is the first part of ROC analysis, used to measure how accurate the edge detectors are. It compares the binary edge map with the ground truth.<br />

**ROC:**<br />
This is the second and last part of ROC, which computes the amount of TPs, FNs, FPs, and TNs, before calculating the true positive and false positive rates.<br />

### How I built them:



### Challenges I ran into:
