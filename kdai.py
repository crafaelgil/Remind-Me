import cv2

filename = './img/3.jpg'
img = cv2.imread(filename)

cv2.imshow('source',img)
cv2.waitKey(0)
