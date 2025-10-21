imageName = getTitle();
setTool("rectangle");
waitForUser("select area to duplicate, then hit OK");
run("Duplicate...", "title=1");
run("Smooth");
run("Smooth");
run("8-bit");
run("Auto Local Threshold", "method=Phansalkar radius=15 parameter_1=0 parameter_2=0 white");
run("Options...", "iterations=3 count=1 black do=Close");
method="Mean";
setAutoThreshold(method);
//run("Threshold...");
setOption("BlackBackground", true);
run("Set Measurements...", "area add redirect=None decimal=3");
run("Analyze Particles...", "size=0.2-200 show=Outlines add");
selectWindow("1");
run("Grays");
//setTool("wand");
waitForUser("Add any missed ROI, then click OK");
roiManager("measure");
roiManager("Show All without labels");
dir = getDirectory("Choose a Directory");
folderName = imageName + "_results";
File.makeDirectory(dir + folderName);
outputdir = (dir + folderName);
dir = getDirectory(outputdir);
for (i=0;i<nImages;i++) {
        selectImage(i+1);
        title = getTitle;
        print(title);
        //ids[i]=getImageID;
        saveAs("tiff", dir+title);
} 
run("Close All");
roiManager("Save", dir + "ROI.zip");
roiManager("delete");


