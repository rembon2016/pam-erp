<?php

namespace App\Traits;

use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;

trait HandleUploadedFile
{
    public function uploadFile(UploadedFile $file, string $folderPrefix, bool $is_encrypted = true)
    {
        $file_name = $file->getClientOriginalName();
        $file_ext = $file->getClientOriginalExtension();
        if ($is_encrypted) {
            $file_name = md5(time().$file_name) . $file_ext;
        }

        $file->storeAs($folderPrefix, $file_name);

        return $file_name;
    }

    public function syncUploadFile(UploadedFile $file, ?string $old_file_name, string $folderPrefix)
    {
        if (! is_null($old_file_name) && Storage::disk('public')->exists("{$folderPrefix}/".$old_file_name)) {
            Storage::disk('public')->delete("{$folderPrefix}/".$old_file_name);
        }

        return $this->uploadFile($file, $folderPrefix);
    }
}
