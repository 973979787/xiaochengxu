import os
import hashlib
from django.views import View
from django.http import Http404, HttpResponse, FileResponse, JsonResponse
from xiaochengxu_d import settings
from utils.response import ReturnCode, CommonResponseMixin


class ImageListView(View, CommonResponseMixin):
    def get(self, request):
        image_files = os.listdir(settings.IMAGE_DIR)
        print(image_files)
        response_data = []
        for image_file in image_files:
            response_data.append(
                {
                    "name": image_file,
                    "md5": image_file[:-4]
                }
            )
        response_data = self.wrap_json_response(data=response_data)
        return JsonResponse(data=response_data)
    pass


class ImageView(View, CommonResponseMixin):
    def get(self, request):
        md5 = request.GET.get('md5')
        imgfile = os.path.join(settings.IMAGE_DIR, md5 + '.jpg')
        print(imgfile)
        if os.path.exists(imgfile):
            data = open(imgfile, 'rb').read()
            # return HttpResponse(data, content_type='image/jpg')
            return FileResponse(open(imgfile, 'rb'), content_type='image/jpg')
        else:
            response = self.wrap_json_response(code=ReturnCode.RESOURCE_NOT_EXISTS)
            return JsonResponse(data=response, safe=False)

    def post(self, request):
        files = request.FILES
        response_data = []
        for key, uploaded_file in files.items():
            print(key)
            print(uploaded_file)
            content = uploaded_file.read()
            md5 = hashlib.md5(content).hexdigest()
            path = os.path.join(settings.IMAGE_DIR, md5 + '.jpg')
            print(md5)
            with open(path, 'wb+') as f:
                f.write(content)
            response_data.append({
                'name': key,
                'md5': md5
            })
        response = self.wrap_json_response(data=response_data, code=ReturnCode.SUCCESS)
        return JsonResponse(data=response, safe=False)

    def delete(self, request):
        md5 = request.GET.get('md5')
        img_name = md5 + '.jpg'
        path = os.path.join(settings.IMAGE_DIR, img_name)
        if os.path.exists(path):
            os.remove(path)
            message = 'remove success.'
        else:
            message = 'file(%s) not found.' % img_name
        response = self.wrap_json_response(code=ReturnCode.SUCCESS, message=message)
        return JsonResponse(data=response, safe=False)