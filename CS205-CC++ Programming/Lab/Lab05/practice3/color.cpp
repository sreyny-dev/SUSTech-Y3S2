//
// Created by Admin on 5/5/2024.
//
#include <opencv2/opencv.hpp>
#include <iostream>

int main() {
    // Load an image
    cv::Mat image = cv::imread("img.png");

    if(image.empty()) {
        std::cerr << "Failed to load image." << std::endl;
        return -1;
    }

    // Convert BGR (OpenCV's default) to RGB
    cv::Mat rgb_image;
    cv::cvtColor(image, rgb_image, cv::COLOR_BGR2RGB);


    // Display or save the converted images as needed
    // For example:
    cv::imshow("RGB Image", rgb_image);
    cv::waitKey(0);

    return 0;
}
