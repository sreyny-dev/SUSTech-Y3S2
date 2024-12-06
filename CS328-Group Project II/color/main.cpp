#include <opencv2/opencv.hpp>
#include <iostream>

int main() {
    // Load an image
    cv::Mat image = cv::imread("img.jpg");

    if(image.empty()) {
        std::cerr << "Failed to load image." << std::endl;
        return -1;
    }
    cv::Mat rgb_image;
    // Convert Grayscale to RGB
    cv::Mat gray_image;
    cv::cvtColor(image, gray_image, cv::COLOR_GRAY2RGB);




    // Display or save the converted images as needed
    // For example:
    cv::imshow("RGB Image", rgb_image);
    cv::waitKey(0);

    return 0;
}

